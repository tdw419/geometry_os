# Solution for Task: Performance tests are created

--- Design ---
# Principles
1. Observation-First: System must observe before learning.
2. Data-Driven: All decisions based on measured data.
3. Incremental Learning: Learn gradually, not all at once.
4. Validation Required: All optimizations must be validated.
5. Explainable: System must explain why optimizations work.

--- System Architecture
1. Performance Monitor: This class tracks CPU execution metrics in real-time and provides a rollup of execution times, FPS, memory usage, and instructions executed.
2. Rollup Window: A rolling window size of 1000 is used to smooth out large fluctuations in performance.
3. Observation Layer: This layer tracks the metrics over time and generates actionable insights.
4. Validation Layer: This layer validates optimizations by comparing them against a baseline or established benchmarks.
5. Explainability Layer: This layer provides explanations for each optimization, allowing users to understand why changes were made.

--- Design Details
1. Performance Monitor:
   - Constructor: A constructor is used to create an object with default values.
   - Metrics: The system tracks CPU execution times, frame rates, memory usage, and instructions executed over time. These metrics are displayed in a chart or graph.
   - Window size: A rolling window of 1000 frames is used to smooth out large fluctuations in performance.
2. Rollup Window:
   - Class definition: The PerformanceMonitor class defines the rollup window size as a property.
   - Methods: There are four methods for tracking metrics:
      - `rollup()`: This method applies a rolling window to the existing metrics data and generates an updated set of metrics.
      - `set(frame_time, fps, memory_usage, instructions)`: This method receives frame times (in seconds), frame rates (in FPS), memory usage (in bytes), and number of instructions executed (in count) as parameters. The method updates the existing rollup window with these values.
   - Property: There is a property for storing the current metrics data in the performance monitor class.
3. Observation Layer:
   - Methods: There are three methods for observing the system's performance:
      - `start()`: This method starts the observation of the system.
      - `stop()`: This method stops the observation of the system.
      - `next_step()`: This method generates a new set of metrics data based on the current state of the system.
   - Property: There is a property for storing the current metrics data in the performance monitor class.
4. Validation Layer:
   - Methods: There are two methods for validating optimizations:
      - `validate_optimization(optimization)`: This method receives an optimization object and validates it against a baseline or benchmark.
      - `compare_with_baseline()`: This method generates a comparison chart between the current system performance and a baseline or established benchmark.
   - Property: There is a property for storing the current metrics data in the performance monitor class.
5. Explainability Layer:
   - Methods: There are two methods for explaining optimizations:
      - `explain_optimization(optimization)`: This method generates an explanation of how the optimization was achieved by comparing it against a baseline or established benchmark.
      - `compare_with_baseline()`: This method generates a comparison chart between the current system performance and a baseline or established benchmark.