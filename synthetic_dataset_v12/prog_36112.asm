; DESCRIPTION: Renders a green line between points (355, 212) and (56, 237).
; PLAN: r0=355(x1), r1=212(y1), r2=56(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 212
LDI r2, 56
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
