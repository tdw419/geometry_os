; DESCRIPTION: Draws a yellow rectangle at (130, 20) with width 37 and height 96.
; PLAN: r0=130(x), r1=20(y), r2=37(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 20
LDI r2, 37
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
