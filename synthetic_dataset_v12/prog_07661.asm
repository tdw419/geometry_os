; DESCRIPTION: Draws a green rectangle at (149, 150) with width 93 and height 15.
; PLAN: r0=149(x), r1=150(y), r2=93(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 150
LDI r2, 93
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
