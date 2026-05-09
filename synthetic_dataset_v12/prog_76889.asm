; DESCRIPTION: Renders a magenta line between points (198, 78) and (508, 136).
; PLAN: r0=198(x1), r1=78(y1), r2=508(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 78
LDI r2, 508
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
