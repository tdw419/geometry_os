; DESCRIPTION: Renders a orange line between points (453, 193) and (424, 128).
; PLAN: r0=453(x1), r1=193(y1), r2=424(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 193
LDI r2, 424
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
