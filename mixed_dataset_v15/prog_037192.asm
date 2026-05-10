; DESCRIPTION: Draws a green rectangle at (15, 130) with width 93 and height 85.
; PLAN: r0=15(x), r1=130(y), r2=93(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 130
LDI r2, 93
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
