; DESCRIPTION: Renders a magenta line between points (227, 40) and (49, 221).
; PLAN: r0=227(x1), r1=40(y1), r2=49(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 40
LDI r2, 49
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
