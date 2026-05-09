; DESCRIPTION: Renders a magenta line between points (495, 210) and (493, 201).
; PLAN: r0=495(x1), r1=210(y1), r2=493(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 210
LDI r2, 493
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
