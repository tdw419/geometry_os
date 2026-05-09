; DESCRIPTION: Renders a black line between points (214, 31) and (211, 232).
; PLAN: r0=214(x1), r1=31(y1), r2=211(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 31
LDI r2, 211
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
