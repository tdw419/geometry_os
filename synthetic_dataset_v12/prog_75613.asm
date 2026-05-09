; DESCRIPTION: Draws a yellow line from (383, 144) to (244, 185).
; PLAN: r0=383(x1), r1=144(y1), r2=244(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 144
LDI r2, 244
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
