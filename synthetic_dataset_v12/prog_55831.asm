; DESCRIPTION: Renders a black line between points (444, 193) and (18, 241).
; PLAN: r0=444(x1), r1=193(y1), r2=18(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 193
LDI r2, 18
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
