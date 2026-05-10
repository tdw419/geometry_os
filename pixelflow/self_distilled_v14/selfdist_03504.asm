; DESCRIPTION: Draws a green rectangle at (4, 93) with width 112 and height 43.
; PLAN: r0=4(x), r1=93(y), r2=112(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 93
LDI r2, 112
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
