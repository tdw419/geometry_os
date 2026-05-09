; DESCRIPTION: Renders a magenta line between points (34, 251) and (153, 150).
; PLAN: r0=34(x1), r1=251(y1), r2=153(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 251
LDI r2, 153
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
