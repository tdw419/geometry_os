; DESCRIPTION: Draws a yellow rectangle at (98, 96) with width 49 and height 23.
; PLAN: r0=98(x), r1=96(y), r2=49(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 96
LDI r2, 49
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
