; DESCRIPTION: Renders a black line between points (101, 26) and (72, 145).
; PLAN: r0=101(x1), r1=26(y1), r2=72(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 26
LDI r2, 72
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
