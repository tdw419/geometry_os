; DESCRIPTION: Renders a black line between points (27, 34) and (204, 45).
; PLAN: r0=27(x1), r1=34(y1), r2=204(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 34
LDI r2, 204
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
