; DESCRIPTION: Draws a black rectangle at (53, 77) with width 114 and height 42.
; PLAN: r0=53(x), r1=77(y), r2=114(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 77
LDI r2, 114
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
