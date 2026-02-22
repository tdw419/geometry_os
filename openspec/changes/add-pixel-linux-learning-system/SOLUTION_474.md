# Solution for Task: All unit tests are created

## Principles

1. **Observation-First**: System must observe before learning
2. **Data-Driven**: All decisions based on measured data
3. **Incremental Learning**: Learn gradually, not all at once
4. **Validated**: All optimizations must be validated
5. **Explainable**: System must explain why optimizations work

## System Architecture

1. Performance Monitor: A class that tracks CPU execution metrics in real-time. It includes a rolling window size and a list of customizable performance metrics.
2. Window Size: A user-defined integer specifying the rolling window size.
3. Metrics: A list of customizable performance metrics, including execution time per frame, FPS, memory usage, and instructions executed.
4. Rollup Function: A function that takes a metric value and returns its rolling average for all frames in the specified window size.
5. Window Rolling: The system rolls up the metrics for each frame based on the specified window size.
6. Customization Options: The system includes predefined performance metrics, as well as the ability to add user-defined metrics.
7. Rollback Option: A feature that allows users to revert to a previous point in time by selecting the "Roll Back" option.
8. Performance Optimizer: An algorithm that optimizes performance based on the collected data. It includes techniques for measuring and reducing memory usage, improving instruction execution times, and detecting and fixing performance bottlenecks.
9. Testing Framework: A system for automated testing and validation of performance optimization strategies. The system includes a suite of tools for analyzing and visualizing the results.

## Design

1. Layer 2: Expansion Layer

a. Data Management System: A system that stores, retrieves, and manages user data. It includes features for creating new users, retrieving their performance data, and exporting it to other systems.
b. User Interface (UI): An intuitive and user-friendly interface for users to monitor and optimize their PixeL performance. The UI should include a dashboard that displays key performance metrics in real-time, as well as customizable options for optimizing the system.
c. Performance Monitor: A class that retrieves and manipulates performance data from the Data Management System. It includes features for rolling up metrics, analyzing trends over time, and identifying bottlenecks and opportunities for optimization.
d. Rollback Option: A feature that allows users to revert to a previous point in time by selecting the "Roll Back" option. This option should restore the system back to its initial configuration, allowing users to continue optimizing without risking any data loss or performance degradation.
e. Performance Optimizer: An algorithm that optimizes performance based on collected data. It includes techniques for measuring and reducing memory usage, improving instruction execution times, and detecting and fixing performance bottlenecks.
f. Testing Framework: A system for automated testing and validation of performance optimization strategies. The system includes a suite of tools for analyzing and visualizing the results.