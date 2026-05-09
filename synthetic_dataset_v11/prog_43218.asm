; DESCRIPTION: Renders a green line between points (242, 89) and (148, 78).
; PLAN: r0=242(x1), r1=89(y1), r2=148(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 89
LDI r2, 148
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
