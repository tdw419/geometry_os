; DESCRIPTION: Composite: . Then Draws a green rectangle at (159, 174) with width 44 and height 74. Then Renders a purple line between points (191, 199) and (181, 254).
; PLAN: r0=159(x), r1=174(y), r2=44(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=191(x1), r1=199(y1), r2=181(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (159, 174) with width 44 and height 74.
; PLAN: r0=159(x), r1=174(y), r2=44(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 174
LDI r2, 44
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (191, 199) and (181, 254).
; PLAN: r0=191(x1), r1=199(y1), r2=181(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 199
LDI r2, 181
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
