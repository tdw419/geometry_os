; DESCRIPTION: Draws a yellow rectangle at (350, 23) with width 90 and height 96.
; PLAN: r0=350(x), r1=23(y), r2=90(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 23
LDI r2, 90
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
