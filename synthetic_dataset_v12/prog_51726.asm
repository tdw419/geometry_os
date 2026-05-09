; DESCRIPTION: Draws a orange line from (192, 218) to (185, 193).
; PLAN: r0=192(x1), r1=218(y1), r2=185(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 218
LDI r2, 185
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
