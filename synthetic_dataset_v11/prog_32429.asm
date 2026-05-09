; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (163, 77) to (110, 255). Then Renders a black disk with center (152, 194) and radius 45.
; PLAN: r0=163(x1), r1=77(y1), r2=110(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=152(x), r1=194(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta line segment connecting (163, 77) to (110, 255).
; PLAN: r0=163(x1), r1=77(y1), r2=110(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 77
LDI r2, 110
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (152, 194) and radius 45.
; PLAN: r0=152(x), r1=194(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 194
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
