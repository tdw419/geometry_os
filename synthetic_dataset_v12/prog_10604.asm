; DESCRIPTION: Renders a orange line between points (278, 138) and (260, 160).
; PLAN: r0=278(x1), r1=138(y1), r2=260(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 138
LDI r2, 260
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
