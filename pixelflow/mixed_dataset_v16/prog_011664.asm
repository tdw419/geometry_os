; DESCRIPTION: Renders a magenta line between points (227, 57) and (433, 85).
; PLAN: r0=227(x1), r1=57(y1), r2=433(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 57
LDI r2, 433
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
