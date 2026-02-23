/**
 * SpecParser - Parses OpenSpec spec.md files
 */
export class SpecParser {
    content;
    constructor(content) {
        this.content = content;
    }
    parse() {
        const lines = this.content.split('\n');
        const spec = {
            name: '',
            overview: '',
            requirements: [],
            metadata: {
                version: '1.0.0',
                format: 'openspec'
            }
        };
        let currentSection = null;
        let currentRequirement = null;
        let requirementId = 0;
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            // Extract name from first H1
            if (line.startsWith('# ') && !spec.name) {
                spec.name = line.substring(2).trim();
                continue;
            }
            // Detect sections
            if (line.startsWith('## ')) {
                const sectionName = line.substring(3).toLowerCase();
                if (sectionName.includes('overview') || sectionName.includes('purpose')) {
                    currentSection = 'overview';
                }
                else if (sectionName.includes('requirement')) {
                    currentSection = 'requirements';
                    // Start a new requirement if on a requirement header
                    const reqMatch = line.match(/##+\s*(?:REQ-)?(\d+)?:?\s*(.+)/);
                    if (reqMatch) {
                        if (currentRequirement) {
                            spec.requirements.push(currentRequirement);
                        }
                        requirementId++;
                        currentRequirement = {
                            id: requirementId,
                            title: reqMatch[2].trim(),
                            text: '',
                            scenarios: []
                        };
                    }
                }
                else {
                    currentSection = null;
                }
                continue;
            }
            // Collect overview text
            if (currentSection === 'overview' && line.trim()) {
                spec.overview += (spec.overview ? '\n' : '') + line.trim();
            }
            // Collect requirement text and scenarios
            if (currentSection === 'requirements') {
                // Scenario detection (bullet points under requirements)
                const scenarioMatch = line.match(/^[-*]\s+(.+)/);
                if (scenarioMatch && currentRequirement) {
                    currentRequirement.scenarios.push({
                        title: scenarioMatch[1].trim(),
                        rawText: scenarioMatch[1].trim()
                    });
                }
                else if (line.trim() && currentRequirement && !line.startsWith('#')) {
                    // Collect requirement text
                    if (!currentRequirement.text ||
                        line.includes('SHALL') ||
                        line.includes('MUST')) {
                        currentRequirement.text += (currentRequirement.text ? ' ' : '') + line.trim();
                    }
                }
            }
        }
        // Push the last requirement
        if (currentRequirement) {
            spec.requirements.push(currentRequirement);
        }
        return spec;
    }
}
//# sourceMappingURL=spec-parser.js.map
