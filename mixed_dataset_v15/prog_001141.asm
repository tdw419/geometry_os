; DESCRIPTION: Draws a black rectangle at (331, 166) with width 88 and height 42.
; PLAN: r0=331(x), r1=166(y), r2=88(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 166
LDI r2, 88
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
