; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (111, 12) with radius 10. Then Renders a purple line between points (125, 117) and (158, 214).
; PLAN: r0=111(x), r1=12(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=125(x1), r1=117(y1), r2=158(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (111, 12) with radius 10.
; PLAN: r0=111(x), r1=12(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 12
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (125, 117) and (158, 214).
; PLAN: r0=125(x1), r1=117(y1), r2=158(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 117
LDI r2, 158
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
