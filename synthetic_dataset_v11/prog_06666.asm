; DESCRIPTION: Renders a black line between points (208, 87) and (86, 101).
; PLAN: r0=208(x1), r1=87(y1), r2=86(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 87
LDI r2, 86
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
