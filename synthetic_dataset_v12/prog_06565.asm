; DESCRIPTION: Renders a black line between points (457, 63) and (138, 45).
; PLAN: r0=457(x1), r1=63(y1), r2=138(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 63
LDI r2, 138
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
