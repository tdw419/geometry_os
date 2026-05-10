; DESCRIPTION: Renders a green line between points (351, 142) and (450, 99).
; PLAN: r0=351(x1), r1=142(y1), r2=450(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 142
LDI r2, 450
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
