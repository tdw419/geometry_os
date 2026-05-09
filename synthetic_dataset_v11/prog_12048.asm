; DESCRIPTION: Composite: . Then Renders a purple disk with center (185, 125) and radius 42. Then Places a orange line segment connecting (225, 55) to (83, 109).
; PLAN: r0=185(x), r1=125(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=225(x1), r1=55(y1), r2=83(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (185, 125) and radius 42.
; PLAN: r0=185(x), r1=125(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 125
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (225, 55) to (83, 109).
; PLAN: r0=225(x1), r1=55(y1), r2=83(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 55
LDI r2, 83
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
