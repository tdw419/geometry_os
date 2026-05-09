; DESCRIPTION: Renders a green line between points (139, 250) and (26, 36).
; PLAN: r0=139(x1), r1=250(y1), r2=26(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 250
LDI r2, 26
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
