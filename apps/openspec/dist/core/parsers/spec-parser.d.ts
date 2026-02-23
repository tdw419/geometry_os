import { z } from 'zod';
export interface Scenario {
    title: string;
    rawText: string;
}
export interface Requirement {
    id: number;
    title: string;
    text: string;
    scenarios: Scenario[];
}
export interface Spec {
    name: string;
    overview: string;
    requirements: Requirement[];
    metadata?: {
        version: string;
        format: string;
        sourcePath?: string;
    };
}
export declare class SpecParser {
    private content;
    constructor(content: string);
    parse(): Spec;
}
//# sourceMappingURL=spec-parser.d.ts.map
