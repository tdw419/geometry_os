; DESCRIPTION: Composite: . Then Renders a orange disk with center (77, 159) and radius 63. Then Places a purple line segment connecting (198, 163) to (218, 180).
; PLAN: r0=77(x), r1=159(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=198(x1), r1=163(y1), r2=218(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (77, 159) and radius 63.
; PLAN: r0=77(x), r1=159(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 159
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (198, 163) to (218, 180).
; PLAN: r0=198(x1), r1=163(y1), r2=218(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 163
LDI r2, 218
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
