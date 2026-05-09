; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (186, 97) with radius 11. Then Renders a red line between points (216, 249) and (132, 246).
; PLAN: r0=186(x), r1=97(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=216(x1), r1=249(y1), r2=132(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (186, 97) with radius 11.
; PLAN: r0=186(x), r1=97(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 97
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (216, 249) and (132, 246).
; PLAN: r0=216(x1), r1=249(y1), r2=132(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 249
LDI r2, 132
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
