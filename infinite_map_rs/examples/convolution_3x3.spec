# 3x3 Convolution Filter

## Description
A 3x3 convolution filter for image processing that applies a weighted sum to a local pixel region.

## Requirements
- Input: 3x3 pixel region (9 pixel values)
- Output: Single pixel value
- Weights: 9 constant weight coefficients
- Operation: Weighted sum + bias
- Data flow: Input cells load, multiply with weights, accumulate results

## Constraints
- Latency < 100 ticks
- Cell count < 256 cells
- Memory usage < 512KB

## Examples
Input: [1, 2, 3, 4, 5, 6, 7, 8, 9]
Weights: [0.1, 0.1, 0.1, 0.1, 0.2, 0.1, 0.1, 0.1, 0.1], Bias=0
Output: 5.0 (weighted average)

Input: [255, 0, 255, 0, 255, 0, 255, 0, 255]
Weights: [1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9], Bias=0
Output: 142 (average)