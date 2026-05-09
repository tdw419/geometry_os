; DESCRIPTION: Draws a yellow line from (348, 244) to (108, 185).
; PLAN: r0=348(x1), r1=244(y1), r2=108(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 244
LDI r2, 108
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
