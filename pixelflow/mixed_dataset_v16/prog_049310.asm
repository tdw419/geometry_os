; DESCRIPTION: Renders a blue line between points (323, 57) and (52, 234).
; PLAN: r0=323(x1), r1=57(y1), r2=52(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 57
LDI r2, 52
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
