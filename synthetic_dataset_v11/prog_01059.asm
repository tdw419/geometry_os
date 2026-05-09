; DESCRIPTION: Composite: . Then Renders a purple line between points (62, 45) and (32, 119). Then Places a orange circle of radius 77 at center (140, 158).
; PLAN: r0=62(x1), r1=45(y1), r2=32(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=140(x), r1=158(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (62, 45) and (32, 119).
; PLAN: r0=62(x1), r1=45(y1), r2=32(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 45
LDI r2, 32
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 77 at center (140, 158).
; PLAN: r0=140(x), r1=158(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 158
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
