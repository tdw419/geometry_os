; DESCRIPTION: Draws a green rectangle at (185, 130) with width 11 and height 72.
; PLAN: r0=185(x), r1=130(y), r2=11(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 130
LDI r2, 11
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
