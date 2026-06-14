#!/usr/bin/env python3
import json
import sys
from pathlib import Path

# Mapping smoke test prompt indices to program_synthesizer categories
PROMPT_TO_CATEGORY = {
    0: "circle",
    1: "fill",
    2: "rectf",
    3: "line",
    4: "fill",
    5: "rectf",
    6: "loop",
    7: "multi",
    8: "line",
    9: "gradient"
}

def main():
    metrics_path = Path("pixelflow/smoke_results/metrics.json")
    if not metrics_path.exists():
        print(f"[!] {metrics_path} not found. Run smoke_test.py first.")
        sys.exit(1)

    with open(metrics_path, "r") as f:
        data = json.load(f)

    results = data["results"]
    cat_scores = {}
    cat_totals = {}

    for i, res in enumerate(results):
        category = PROMPT_TO_CATEGORY.get(i, "unknown")
        cat_scores[category] = cat_scores.get(category, 0) + (1 if res["success"] else 0)
        cat_totals[category] = cat_totals.get(category, 0) + 1

    print("\n[*] Per-Category Performance:")
    weakest_cat = None
    min_score = 1.1

    summary = {}
    for cat in cat_totals:
        score = cat_scores[cat] / cat_totals[cat]
        summary[cat] = score
        print(f"    {cat:10}: {cat_scores[cat]}/{cat_totals[cat]} ({score:.1%})")
        
        if score < min_score:
            min_score = score
            weakest_cat = cat

    print(f"\n[*] Weakest category: {weakest_cat} ({min_score:.1%})")

    # Save evaluation summary
    eval_path = Path("pixelflow/smoke_results/evaluation.json")
    with open(eval_path, "w") as f:
        json.dump({
            "epoch": data["epoch"],
            "loss": data["loss"],
            "category_scores": summary,
            "weakest_category": weakest_cat,
            "min_score": min_score
        }, f, indent=4)
    print(f"[*] Evaluation saved to {eval_path}")

if __name__ == "__main__":
    main()
