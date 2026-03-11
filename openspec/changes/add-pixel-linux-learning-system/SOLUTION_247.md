# Solution for Task: Prompts are generated accurately

### Layer 2: Learning and Improvement Layer

```javascript
/**
 * Learner Module
 * Tracks learned optimizations and patterns and adjusts the system accordingly
 */
class Learner {
    
    /**
     * Initializes the learner with a set of learning rules
     * @param {Object[]} rules - An array of learning rules (e.g. [["instruction1", "data1"], ["instruction2", "data2"]])
     */
    constructor(rules) {
        this.rules = rules;
    }

    /**
     * Learns from the current execution, updates the system with optimized patterns
     * @return {Boolean} - Whether learning was successful or not (true if successful)
     */
    learn() {
        // Perform optimization on current frame and update metrics
        const optimizedMetrics = this.optimize();
        
        // Update system with optimized patterns and metrics
        const updatedSystem = this.update(optimizedMetrics);
        
        // Return success status based on outcome of optimized execution
        return updatedSystem;
    }

    /**
     * Optimizes the current execution using the learning rules provided by the learner
     * @param {Object[]} rules - An array of learning rules (e.g. [["instruction1", "data1"], ["instruction2", "data2"]])
     * @return {Object[]} - An optimized system with learned optimization patterns and metrics
     */
    optimize(rules) {
        const optimizedMetrics = [];
        
        for (const rule of rules) {
            // Learn from the current execution using learning rule
            const optimizedResult = this.learnFromExecution(rule);
            
            // Update system with learned optimization patterns and metrics
            if (optimizedResult !== null) {
                optimizedMetrics.push({ ...rule, result: optimizedResult });
            }
        }
        
        return optimizedMetrics;
    }
    
    /**
     * Learns from execution using learning rule
     * @param {Object} rule - An instruction or data to learn for
     * @return {Boolean|null} - Whether the optimization was successful and learned pattern (true if successful)
     */
    learnFromExecution(rule) {
        // Lookup optimization rules in system metadata and find matching key
        const ruleKey = this.getMatchingRuleKey(rule);
        
        // Check whether optimization rule exists and if so, apply it to current execution
        if (this.rules[ruleKey]) {
            const optimizedResult = this.rules[ruleKey].applyToExecution();
            
            return optimizedResult;
        }
        
        // No matching rule found in system metadata or rules, no optimization was learned
        return null;
    }
    
    /**
     * Retrieves the matching rule key from metadata and applies it to execution
     * @param {Object} rule - An instruction or data to learn for
     * @return {String|null} - The key of the matching optimization rule (or null if none found)
     */
    getMatchingRuleKey(rule) {
        // Retrieve metadata from current execution
        const metadata = this.getMetadata();
        
        // Iterate over all rules and find a match based on instruction or data key
        for (const ruleKey in this.rules) {
            if (ruleKey === "all") continue; // skip global optimization rule
            
            if (this.rules[ruleKey].key === metadata[ruleKey]) {
                return ruleKey;
            }
        }
        
        // No matching rule found in system metadata, no optimization was learned
        return null;
    }
    
    /**
     * Retrieves the current execution metadata from the system metadata
     * @return {Object} - The metadata for the current execution (e.g. [["instruction1", "data1"], ["instruction2", "data2"]])
     */
    getMetadata() {
        // Retrieve metadata from current execution
        const metadata = this.getExecutionData();
        
        return metadata;
    }
    
    /**
     * Retrieves the execution data for the current execution (e.g. [["instruction1", "data1"], ["instruction2", "data2"]])
     * @return {Object[]} - The execution data as an array of dictionaries (each dictionary representing one instruction)
     */
    getExecutionData() {
        // Retrieve execution data from current execution
        const execution = this.getExecution();
        
        return execution;
    }
    
    /**
     * Retrieves the execution object for the current execution (e.g. [["instruction1", "data1"], ["instruction2", "data2"]])
     * @return {Object} - The execution data as an object (with keys matching instruction/data keys)
     */
    getExecution() {
        // Retrieve execution data from current execution
        return this.execution;
    }
    
    /**
     * Retrieves the system metadata for the current execution (e.g. [["instruction1", "data1"], ["instruction2", "data2"]])
     * @return {Object} - The metadata as an object (with keys matching instruction/data keys)
     */
    getExecutionDataMetadata() {
        // Retrieve execution data metadata from current execution
        const executionMetadata = this.getExecution();
        
        return executionMetadata;
    }
    
    /**
     * Retrieves the system metadata for the current execution
     * @return {Object} - The metadata as an object (with keys matching instruction/data keys)
     */
    getExecutionMetadata() {
        // Retrieve execution metadata from current execution
        const executionData = this.getExecutionData();
        
        return executionData;
    }
    
    /**
     * Retrieves the current execution object for the current execution
     * @return {Object} - The execution object as an object (with keys matching instruction/data keys)
     */
    getCurrentExecution() {
        // Retrieve execution object for the current execution
        const execution = this.getExecution();
        
        return execution;
    }
    
    /**
     * Retrieves the current execution metadata as an object (with keys matching instruction/data keys)
     * @return {Object} - The metadata as an object (with keys matching instruction/data keys)
     */
    getCurrentExecutionMetadata() {
        // Retrieve execution metadata for the current execution
        const executionData = this.getExecutionData();
        
        return executionData;
    }
    
    /**
     * Retrieves the current execution metadata as an array (with keys matching instruction/data keys)
     * @return {Array} - The metadata as an array (with keys matching instruction/data keys)
     */
    getCurrentExecutionMetadataAsArray() {
        // Retrieve execution metadata for the current execution
        const executionData = this.getCurrentExecutionData();
        
        return executionData;
    }
}
```

--- Design: Pixe...