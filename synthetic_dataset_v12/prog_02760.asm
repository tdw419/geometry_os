; DESCRIPTION: Renders a black line between points (26, 129) and (110, 134).
; PLAN: r0=26(x1), r1=129(y1), r2=110(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 129
LDI r2, 110
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
