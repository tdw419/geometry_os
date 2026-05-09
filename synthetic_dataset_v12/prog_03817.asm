; DESCRIPTION: Draws a blue rectangle at (406, 130) with width 76 and height 51.
; PLAN: r0=406(x), r1=130(y), r2=76(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 130
LDI r2, 76
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
