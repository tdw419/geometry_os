; DESCRIPTION: Places a black 81x29 rectangle at position (156, 116).
; PLAN: r0=156(x), r1=116(y), r2=81(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 116
LDI r2, 81
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
