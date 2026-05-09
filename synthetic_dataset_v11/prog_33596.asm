; DESCRIPTION: Composite: . Then Renders a blue disk with center (179, 79) and radius 77. Then Places a magenta line segment connecting (1, 189) to (190, 18).
; PLAN: r0=179(x), r1=79(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=1(x1), r1=189(y1), r2=190(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (179, 79) and radius 77.
; PLAN: r0=179(x), r1=79(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 79
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (1, 189) to (190, 18).
; PLAN: r0=1(x1), r1=189(y1), r2=190(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 189
LDI r2, 190
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
