; DESCRIPTION: Renders a black line between points (145, 11) and (2, 167).
; PLAN: r0=145(x1), r1=11(y1), r2=2(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 11
LDI r2, 2
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
