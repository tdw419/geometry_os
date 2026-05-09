; DESCRIPTION: Renders a black line between points (457, 27) and (204, 44).
; PLAN: r0=457(x1), r1=27(y1), r2=204(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 27
LDI r2, 204
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
