; DESCRIPTION: Draws a yellow rectangle at (196, 14) with width 20 and height 117.
; PLAN: r0=196(x), r1=14(y), r2=20(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 14
LDI r2, 20
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
