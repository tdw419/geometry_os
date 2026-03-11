# Solution for Task: I/O bottlenecks are detected

## Principles

1. **Observation-First**: System observes and records performance metrics before making any optimization decisions.
2. **Data-Driven**: All decision-making is based on measured data, rather than assumptions or hunches.
3. **Incremental Learning**: Optimizations are made gradually, not all at once.
4. **Validation Required**: All optimization decisions must be validated before being applied to the system.
5. **Explainable**: System must provide clear explanations for any optimization choices made.

## System Architecture

1. Performance Monitor (PM): This class monitors CPU execution metrics in real-time and records them into a data structure. It also tracks CPU performance metrics, such as execution time per frame, FPS, memory usage, and instruction counts, for later analysis.
2. Window Size: The window size determines how frequently the PM records performance metrics. A smaller window size allows more frequent recordings but reduces throughput. A larger window size increases throughput but may result in poorer accuracy due to a higher number of observations.
3. Rollup: The PM accumulates performance metrics over time and creates rolling windows for each metric. This ensures that the data is representative of the system's average behavior over longer periods.
4. Data Visualization: The PM visualizes performance metrics using charts or graphs to help identify trends and patterns.
5. Optimization Decisions: Once optimization decisions have been validated, they are applied incrementally to the system. For example, a new instruction might be added to the CPU codebase, or a new optimization strategy might be tested.
6. Automatic Testing: Automated testing is used to verify that the optimized system behaves as expected and provides clear evidence of the effectiveness of the optimization.
7. Performance Tuning: Once performance has been optimized, it's essential to test for any remaining issues or bottlenecks in the system. This can be done using a variety of tools and techniques, including profiling tools like `cProfile` and `pstats`.
8. Continuous Integration/Continuous Deployment: The PM automates this testing process through continuous integration (CI) and continuous deployment (CD). CI ensures that the system is continuously tested and deployed to production. CD automates the deployment process, allowing for rapid changes and updates.
9. Knowledge Base: A knowledge base is created using the data collected during optimization. This can be used to generate more comprehensive optimization strategies based on real-world performance data.

## Design Elements

1. Observation-First Principle: The PM is designed with observation-first principles in mind, rather than assumptions or hunches.
2. Data-Driven Principle: All decision-making is based on measured data, rather than assumptions or hunches.
3. Incremental Learning Principle: Optimizations are made gradually, not all at once.
4. Validation Required Principle: All optimization decisions must be validated before being applied to the system.
5. Explainable Principle: System must provide clear explanations for any optimization choices made.