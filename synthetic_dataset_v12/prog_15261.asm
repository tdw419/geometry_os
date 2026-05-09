; DESCRIPTION: Renders a black line between points (117, 192) and (483, 9).
; PLAN: r0=117(x1), r1=192(y1), r2=483(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 192
LDI r2, 483
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
