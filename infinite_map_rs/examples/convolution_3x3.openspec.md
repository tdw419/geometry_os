# OpenSpec: 3x3 Convolution Filter

## Description
A spatial circuit for applying a 3x3 convolution filter to image pixel data.

## Requirements
- Input: 3x3 pixel region (9 values)
- Output: 1 pixel (weighted sum)
- Weights: 9 floating-point values (convolution kernel)
- Operation: Sum of (pixel_i × weight_i)
- Latency: < 100 ticks
- Throughput: > 50 cells/tick

## Constraints
- Latency < 100 ticks
- Throughput >= 50 cells/tick
- Accuracy == 1.0 (exact arithmetic)

## Examples
Input: [1, 2, 3, 4, 5, 6, 7, 8, 9]
Weights: [0.1, 0.1, 0.1, 0.1, 0.2, 0.1, 0.1, 0.1, 0.1]
Output: 5.0 (weighted sum)