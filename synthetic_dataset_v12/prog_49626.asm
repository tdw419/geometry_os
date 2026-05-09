; DESCRIPTION: Draws a green rectangle at (159, 120) with width 86 and height 78.
; PLAN: r0=159(x), r1=120(y), r2=86(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 120
LDI r2, 86
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
