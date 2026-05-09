; DESCRIPTION: Places a purple 116x64 rectangle at position (240, 182).
; PLAN: r0=240(x), r1=182(y), r2=116(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 182
LDI r2, 116
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
