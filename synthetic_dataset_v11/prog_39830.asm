; DESCRIPTION: Renders a orange line between points (70, 35) and (132, 192).
; PLAN: r0=70(x1), r1=35(y1), r2=132(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 35
LDI r2, 132
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
