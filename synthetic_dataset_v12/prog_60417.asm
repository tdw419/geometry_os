; DESCRIPTION: Renders a black line between points (370, 87) and (427, 87).
; PLAN: r0=370(x1), r1=87(y1), r2=427(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 87
LDI r2, 427
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
