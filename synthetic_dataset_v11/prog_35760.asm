; DESCRIPTION: Renders a magenta line between points (37, 51) and (13, 206).
; PLAN: r0=37(x1), r1=51(y1), r2=13(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 51
LDI r2, 13
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
