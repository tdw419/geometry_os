; DESCRIPTION: Draws a yellow line from (145, 50) to (244, 202).
; PLAN: r0=145(x1), r1=50(y1), r2=244(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 50
LDI r2, 244
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
