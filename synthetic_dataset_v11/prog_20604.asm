; DESCRIPTION: Draws a green rectangle at (137, 27) with width 49 and height 23.
; PLAN: r0=137(x), r1=27(y), r2=49(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 27
LDI r2, 49
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
