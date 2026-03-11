# Solution for Task: BottleneckDetector class created

#### Principles:
1. Observation-First: System must observe before learning.
2. Data-Driven: All decisions based on measured data.
3. Incremental Learning: Learn gradually, not all at once.
4. Validation Required: All optimization decisions must be validated.
5. Explainable: System must explain why optimization decisions work.

#### System Architecture:
- Layer 1: Performance Monitoring (PM) layer that tracks CPU execution metrics in real-time.
- Layer 2: Window Size (WS): Roll-up window size for measurement data. This allows for a more accurate estimate of performance over time, and can be adjusted as needed.
- Layer 3: Data Processing (DP) layer that aggregates and validates measured data to extract insights.
- Layer 4: Optimization Decision Making (ODM) layer that selects the most effective optimization technique based on performance metrics, and ensures that all decisions are validated.
- Layer 5: Performance Metrics Reporting (PMR) layer that provides an overview of performance metrics at different levels of granularity for each optimized execution.
- Layer 6: User Interface (UI) layer that allows the user to interact with the system and provide feedback for optimization decisions.

#### Design Details:
- The PM layer is responsible for tracking CPU execution metrics in real-time, including CPU time, frame rate, memory usage, and instructions executed.
- The window size determines how frequently data is collected and aggregated into a rolling metric over time. This allows for more accurate measurement of performance over time.
- The DP layer uses the measured data to select an effective optimization technique based on performance metrics.
- Optimization decisions are made at the ODM layer by ensuring that all decisions are validated before they are applied.
- Performance metrics reporting is provided by PMR layer, which provides an overview of performance metrics at different levels of granularity for each optimized execution.
- The UI layer allows users to interact with the system and provide feedback for optimization decisions. This includes creating files or running scripts, providing instructions, and navigating through the system to find optimal settings.