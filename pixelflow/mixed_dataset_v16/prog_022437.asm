; DESCRIPTION: Renders a black line between points (501, 118) and (504, 132).
; PLAN: r0=501(x1), r1=118(y1), r2=504(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 118
LDI r2, 504
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
