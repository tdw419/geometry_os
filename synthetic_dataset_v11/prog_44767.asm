; DESCRIPTION: Renders a magenta line between points (83, 181) and (104, 1).
; PLAN: r0=83(x1), r1=181(y1), r2=104(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 181
LDI r2, 104
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
