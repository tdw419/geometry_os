; DESCRIPTION: Composite: Renders a orange disk with center (119, 84) and radius 78 then Renders a blue line between points (210, 200) and (23, 226).
; PLAN: r0=119(x), r1=84(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x1), r6=200(y1), r7=23(x2), r8=226(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 84
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 200
LDI r7, 23
LDI r8, 226
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
