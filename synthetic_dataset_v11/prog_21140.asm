; DESCRIPTION: Renders a black line between points (176, 26) and (242, 119).
; PLAN: r0=176(x1), r1=26(y1), r2=242(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 26
LDI r2, 242
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
