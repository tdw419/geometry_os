; DESCRIPTION: Draws a black line from (234, 65) to (110, 85).
; PLAN: r0=234(x1), r1=65(y1), r2=110(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 65
LDI r2, 110
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
