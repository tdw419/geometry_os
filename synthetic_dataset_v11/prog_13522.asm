; DESCRIPTION: Composite: . Then Draws a red rectangle at (176, 34) with width 37 and height 77. Then Renders a black line between points (26, 94) and (159, 84).
; PLAN: r0=176(x), r1=34(y), r2=37(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=26(x1), r1=94(y1), r2=159(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (176, 34) with width 37 and height 77.
; PLAN: r0=176(x), r1=34(y), r2=37(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 34
LDI r2, 37
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (26, 94) and (159, 84).
; PLAN: r0=26(x1), r1=94(y1), r2=159(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 94
LDI r2, 159
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
