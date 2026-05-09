; DESCRIPTION: Renders a magenta line between points (130, 38) and (221, 97).
; PLAN: r0=130(x1), r1=38(y1), r2=221(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 38
LDI r2, 221
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
