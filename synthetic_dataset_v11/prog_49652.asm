; DESCRIPTION: Renders a black line between points (3, 208) and (145, 118).
; PLAN: r0=3(x1), r1=208(y1), r2=145(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 208
LDI r2, 145
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
