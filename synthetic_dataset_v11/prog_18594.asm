; DESCRIPTION: Renders a orange line between points (132, 249) and (73, 75).
; PLAN: r0=132(x1), r1=249(y1), r2=73(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 249
LDI r2, 73
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
