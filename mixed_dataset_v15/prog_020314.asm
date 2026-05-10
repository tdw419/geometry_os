; DESCRIPTION: Draws a black rectangle at (388, 42) with width 81 and height 28.
; PLAN: r0=388(x), r1=42(y), r2=81(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 42
LDI r2, 81
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
