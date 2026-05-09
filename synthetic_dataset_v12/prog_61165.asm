; DESCRIPTION: Renders a blue line between points (353, 33) and (66, 89).
; PLAN: r0=353(x1), r1=33(y1), r2=66(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 33
LDI r2, 66
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
