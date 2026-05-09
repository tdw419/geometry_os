; DESCRIPTION: Draws a yellow rectangle at (285, 37) with width 84 and height 102.
; PLAN: r0=285(x), r1=37(y), r2=84(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 37
LDI r2, 84
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
