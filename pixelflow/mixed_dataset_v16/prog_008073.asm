; DESCRIPTION: Draws a green rectangle at (424, 130) with width 58 and height 117.
; PLAN: r0=424(x), r1=130(y), r2=58(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 130
LDI r2, 58
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
