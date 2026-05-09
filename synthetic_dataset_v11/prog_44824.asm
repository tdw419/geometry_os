; DESCRIPTION: Renders a black line between points (150, 109) and (105, 99).
; PLAN: r0=150(x1), r1=109(y1), r2=105(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 109
LDI r2, 105
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
