; DESCRIPTION: Places a black 81x26 rectangle at position (49, 116).
; PLAN: r0=49(x), r1=116(y), r2=81(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 116
LDI r2, 81
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
