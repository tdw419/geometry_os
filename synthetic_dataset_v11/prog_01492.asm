; DESCRIPTION: Places a black 116x64 rectangle at position (53, 95).
; PLAN: r0=53(x), r1=95(y), r2=116(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 95
LDI r2, 116
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
