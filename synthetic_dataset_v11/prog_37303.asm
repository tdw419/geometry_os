; DESCRIPTION: Renders a black line between points (131, 186) and (132, 85).
; PLAN: r0=131(x1), r1=186(y1), r2=132(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 186
LDI r2, 132
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
