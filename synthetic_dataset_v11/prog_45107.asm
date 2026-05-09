; DESCRIPTION: Draws a yellow rectangle at (196, 137) with width 50 and height 74.
; PLAN: r0=196(x), r1=137(y), r2=50(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 137
LDI r2, 50
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
