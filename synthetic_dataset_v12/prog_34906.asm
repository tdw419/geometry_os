; DESCRIPTION: Draws a yellow rectangle at (386, 136) with width 74 and height 99.
; PLAN: r0=386(x), r1=136(y), r2=74(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 136
LDI r2, 74
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
