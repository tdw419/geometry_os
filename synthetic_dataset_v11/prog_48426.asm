; DESCRIPTION: Composite: . Then Renders a blue line between points (87, 198) and (38, 121). Then Renders a orange disk with center (190, 140) and radius 23.
; PLAN: r0=87(x1), r1=198(y1), r2=38(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=190(x), r1=140(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (87, 198) and (38, 121).
; PLAN: r0=87(x1), r1=198(y1), r2=38(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 198
LDI r2, 38
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (190, 140) and radius 23.
; PLAN: r0=190(x), r1=140(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 140
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
