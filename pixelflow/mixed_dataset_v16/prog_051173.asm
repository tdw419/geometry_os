; DESCRIPTION: Draws a purple rectangle at (6, 196) with width 17 and height 40.
; PLAN: r0=6(x), r1=196(y), r2=17(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 196
LDI r2, 17
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
