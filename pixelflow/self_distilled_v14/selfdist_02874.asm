; DESCRIPTION: Draws a yellow rectangle at (4, 127) with width 74 and height 119.
; PLAN: r0=4(x), r1=127(y), r2=74(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 127
LDI r2, 74
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
