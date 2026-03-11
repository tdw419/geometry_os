#!/usr/bin/env python3
"""
Training Feedback Survey
Collects user feedback on the Native Glyph Shell training program.

Usage:
    python3 feedback_survey.py
"""

import json
import os
from datetime import datetime
from pathlib import Path
from typing import Any


class FeedbackSurvey:
    """Interactive feedback survey for training program."""
    
    def __init__(self):
        self.responses: dict[str, Any] = {}
        self.results_dir = Path.home() / ".glyph_shell" / "training"
        self.results_dir.mkdir(parents=True, exist_ok=True)
        
    def clear_screen(self):
        """Clear the terminal screen."""
        os.system('clear' if os.name == 'posix' else 'cls')
    
    def print_header(self, title: str):
        """Print a formatted header."""
        self.clear_screen()
        print("\n" + "=" * 60)
        print(f"  {title}")
        print("=" * 60 + "\n")
    
    def print_question(self, number: int, question: str):
        """Print a formatted question."""
        print(f"\n{number}. {question}")
        print("-" * 60)
    
    def get_rating(self, prompt: str, min_val: int = 1, max_val: int = 5) -> int:
        """Get a rating from the user."""
        while True:
            try:
                value = int(input(f"{prompt} ({min_val}-{max_val}): "))
                if min_val <= value <= max_val:
                    return value
                print(f"Please enter a number between {min_val} and {max_val}.")
            except ValueError:
                print("Please enter a valid number.")
    
    def get_text(self, prompt: str, optional: bool = False) -> str:
        """Get text input from the user."""
        suffix = " (optional)" if optional else ""
        response = input(f"{prompt}{suffix}: ").strip()
        return response if response else "" if optional else self.get_text(prompt, optional)
    
    def get_yes_no(self, prompt: str) -> bool:
        """Get a yes/no response."""
        while True:
            response = input(f"{prompt} (y/n): ").strip().lower()
            if response in ['y', 'yes']:
                return True
            elif response in ['n', 'no']:
                return False
            print("Please enter 'y' or 'n'.")
    
    def get_multiple_choice(self, prompt: str, choices: list[str]) -> str:
        """Get a multiple choice response."""
        print(f"\n{prompt}")
        for i, choice in enumerate(choices, 1):
            print(f"  {i}. {choice}")
        
        while True:
            try:
                value = int(input("Select number: "))
                if 1 <= value <= len(choices):
                    return choices[value - 1]
                print(f"Please enter a number between 1 and {len(choices)}.")
            except ValueError:
                print("Please enter a valid number.")
    
    def get_multiple_select(self, prompt: str, choices: list[str]) -> list[str]:
        """Get multiple selections from a list."""
        print(f"\n{prompt} (comma-separated numbers, e.g., '1,3,5')")
        for i, choice in enumerate(choices, 1):
            print(f"  {i}. {choice}")
        
        while True:
            try:
                response = input("Select numbers: ").strip()
                indices = [int(x.strip()) for x in response.split(',')]
                if all(1 <= i <= len(choices) for i in indices):
                    return [choices[i - 1] for i in indices]
                print(f"Please enter numbers between 1 and {len(choices)}.")
            except ValueError:
                print("Please enter valid numbers separated by commas.")
    
    def section_overall_satisfaction(self):
        """Collect overall satisfaction ratings."""
        self.print_header("Section 1: Overall Satisfaction")
        
        self.print_question(1, "How would you rate the overall training program?")
        self.responses['overall_rating'] = self.get_rating("Rating")
        
        self.print_question(2, "How likely are you to recommend this training?")
        self.responses['nps_score'] = self.get_rating("Rating", 0, 10)
        
        self.print_question(3, "Did the training meet your expectations?")
        self.responses['met_expectations'] = self.get_yes_no("Response")
        
        self.print_question(4, "Was the training duration appropriate?")
        choices = ["Too short", "Just right", "Too long", "Much too long"]
        self.responses['duration_feedback'] = self.get_multiple_choice("Select", choices)
    
    def section_content_quality(self):
        """Collect content quality feedback."""
        self.print_header("Section 2: Content Quality")
        
        # Module ratings
        modules = [
            ("Module 1: Introduction", "module_1_rating"),
            ("Module 2: Basic Operations", "module_2_rating"),
            ("Module 3: Process Management", "module_3_rating"),
            ("Module 4: Advanced Features", "module_4_rating"),
            ("Module 5: Customization", "module_5_rating"),
        ]
        
        self.responses['module_ratings'] = {}
        for module_name, key in modules:
            print(f"\nRate {module_name}:")
            self.responses['module_ratings'][key] = self.get_rating("Rating")
        
        self.print_question(6, "How would you rate the clarity of explanations?")
        self.responses['clarity_rating'] = self.get_rating("Rating")
        
        self.print_question(7, "How would you rate the quality of examples?")
        self.responses['examples_rating'] = self.get_rating("Rating")
        
        self.print_question(8, "How would you rate the exercises?")
        self.responses['exercises_rating'] = self.get_rating("Rating")
    
    def section_learning_outcomes(self):
        """Collect learning outcomes data."""
        self.print_header("Section 3: Learning Outcomes")
        
        self.print_question(9, "Do you feel confident using the Native Glyph Shell?")
        self.responses['confidence'] = self.get_rating("Confidence level")
        
        self.print_question(10, "Which skills do you feel you learned well?")
        skills = [
            "Shell navigation",
            "Glyph commands",
            "Process management",
            "Scripting",
            "Customization",
            "Integration with other systems",
        ]
        self.responses['learned_skills'] = self.get_multiple_select("Select all that apply", skills)
        
        self.print_question(11, "Which topics need more coverage?")
        self.responses['needs_more_coverage'] = self.get_multiple_select("Select all that apply", skills)
        
        self.print_question(12, "What was the most valuable thing you learned?")
        self.responses['most_valuable'] = self.get_text("Your answer", optional=True)
    
    def section_technical_aspects(self):
        """Collect technical feedback."""
        self.print_header("Section 4: Technical Aspects")
        
        self.print_question(13, "How would you rate the training pace?")
        choices = ["Too slow", "A bit slow", "Just right", "A bit fast", "Too fast"]
        self.responses['pace'] = self.get_multiple_choice("Select", choices)
        
        self.print_question(14, "Did you encounter technical issues?")
        self.responses['had_issues'] = self.get_yes_no("Response")
        
        if self.responses['had_issues']:
            self.print_question(15, "Describe the issues you encountered:")
            self.responses['issues_description'] = self.get_text("Description", optional=True)
        
        self.print_question(16, "Was the documentation adequate?")
        self.responses['documentation_rating'] = self.get_rating("Rating")
    
    def section_improvements(self):
        """Collect improvement suggestions."""
        self.print_header("Section 5: Suggestions for Improvement")
        
        self.print_question(17, "What would you add to the training?")
        self.responses['suggestions_add'] = self.get_text("Your suggestions", optional=True)
        
        self.print_question(18, "What would you remove or change?")
        self.responses['suggestions_remove'] = self.get_text("Your suggestions", optional=True)
        
        self.print_question(19, "What additional topics should be covered?")
        self.responses['additional_topics'] = self.get_text("Topics", optional=True)
        
        self.print_question(20, "Any other feedback?")
        self.responses['other_feedback'] = self.get_text("Your feedback", optional=True)
    
    def section_future_use(self):
        """Collect future use intentions."""
        self.print_header("Section 6: Future Use")
        
        self.print_question(21, "How do you plan to use the Native Glyph Shell?")
        uses = [
            "Daily development work",
            "System administration",
            "Data analysis/visualization",
            "Process automation",
            "Research/experimentation",
            "Just exploring",
        ]
        self.responses['planned_uses'] = self.get_multiple_select("Select all that apply", uses)
        
        self.print_question(22, "Would you like advanced training?")
        self.responses['want_advanced_training'] = self.get_yes_no("Response")
        
        advanced_topics = [
            "GPU programming",
            "Advanced scripting",
            "Evolution daemon deep dive",
            "Performance optimization",
            "Integration patterns",
            "Security considerations",
        ]
        
        if self.responses['want_advanced_training']:
            self.print_question(23, "Which advanced topics interest you?")
            self.responses['advanced_interests'] = self.get_multiple_select(
                "Select all that apply", advanced_topics
            )
    
    def section_demographics(self):
        """Collect demographic data (optional)."""
        self.print_header("Section 7: Background (Optional)")
        
        print("\nThese questions are optional and help us improve the training.")
        
        self.print_question(24, "What is your experience level with command-line interfaces?")
        choices = ["Beginner", "Intermediate", "Advanced", "Expert"]
        self.responses['cli_experience'] = self.get_multiple_choice("Select", choices)
        
        self.print_question(25, "What is your primary role?")
        roles = [
            "Software Developer",
            "System Administrator",
            "Data Scientist",
            "Researcher",
            "Student",
            "Hobbyist",
            "Other",
        ]
        self.responses['role'] = self.get_multiple_choice("Select", roles)
        
        self.print_question(26, "How did you hear about Geometry OS?")
        self.responses['source'] = self.get_text("Your answer", optional=True)
    
    def save_results(self):
        """Save survey results to file."""
        self.responses['timestamp'] = datetime.now().isoformat()
        self.responses['version'] = "1.0"
        
        filename = f"feedback_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        filepath = self.results_dir / filename
        
        with open(filepath, 'w') as f:
            json.dump(self.responses, f, indent=2)
        
        return filepath
    
    def display_summary(self):
        """Display a summary of responses."""
        self.print_header("Survey Summary")
        
        print("Thank you for your feedback!\n")
        print("Your responses:")
        print(f"  Overall Rating: {self.responses.get('overall_rating', 'N/A')}/5")
        print(f"  NPS Score: {self.responses.get('nps_score', 'N/A')}/10")
        print(f"  Confidence Level: {self.responses.get('confidence', 'N/A')}/5")
        print(f"  Would Recommend: {'Yes' if self.responses.get('nps_score', 0) >= 7 else 'No'}")
        
        print("\nTop learned skills:")
        for skill in self.responses.get('learned_skills', [])[:3]:
            print(f"  • {skill}")
        
        print("\nResults saved for analysis.")
        print("To submit to the team, please share the generated file or")
        print("create an issue at: https://github.com/tdw419/geometry_os/issues")
    
    def run(self):
        """Run the complete survey."""
        self.print_header("Native Glyph Shell Training Feedback Survey")
        
        print("Welcome to the training feedback survey!")
        print("Your responses help us improve the training program.")
        print("\nThis survey takes approximately 5-10 minutes.")
        print("All questions are optional unless marked otherwise.\n")
        
        input("Press Enter to begin...")
        
        try:
            self.section_overall_satisfaction()
            self.section_content_quality()
            self.section_learning_outcomes()
            self.section_technical_aspects()
            self.section_improvements()
            self.section_future_use()
            self.section_demographics()
            
            filepath = self.save_results()
            self.display_summary()
            
            print(f"\nFeedback saved to: {filepath}")
            
        except KeyboardInterrupt:
            print("\n\nSurvey cancelled. Partial responses not saved.")
            return 1
        
        return 0


def main():
    """Main entry point."""
    survey = FeedbackSurvey()
    return survey.run()


if __name__ == "__main__":
    exit(main())
