; DESCRIPTION: Composite: . Then Renders a blue disk with center (168, 93) and radius 63. Then Draws a orange line from (191, 106) to (47, 80).
; PLAN: r0=168(x), r1=93(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=191(x1), r1=106(y1), r2=47(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (168, 93) and radius 63.
; PLAN: r0=168(x), r1=93(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 93
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (191, 106) to (47, 80).
; PLAN: r0=191(x1), r1=106(y1), r2=47(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 106
LDI r2, 47
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
