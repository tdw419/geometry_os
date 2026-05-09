; DESCRIPTION: Draws a green rectangle at (350, 101) with width 93 and height 112.
; PLAN: r0=350(x), r1=101(y), r2=93(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 101
LDI r2, 93
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
