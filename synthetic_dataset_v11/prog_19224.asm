; DESCRIPTION: Composite: . Then Renders a white disk with center (200, 29) and radius 22. Then Places a magenta line segment connecting (144, 190) to (241, 79).
; PLAN: r0=200(x), r1=29(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=144(x1), r1=190(y1), r2=241(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (200, 29) and radius 22.
; PLAN: r0=200(x), r1=29(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 29
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (144, 190) to (241, 79).
; PLAN: r0=144(x1), r1=190(y1), r2=241(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 190
LDI r2, 241
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
