; DESCRIPTION: Renders a magenta line between points (200, 45) and (444, 21).
; PLAN: r0=200(x1), r1=45(y1), r2=444(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 45
LDI r2, 444
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
