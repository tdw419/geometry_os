; DESCRIPTION: Renders a black line between points (98, 54) and (122, 161).
; PLAN: r0=98(x1), r1=54(y1), r2=122(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 54
LDI r2, 122
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
