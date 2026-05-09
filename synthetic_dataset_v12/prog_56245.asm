; DESCRIPTION: Draws a red line from (151, 76) to (244, 155).
; PLAN: r0=151(x1), r1=76(y1), r2=244(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 76
LDI r2, 244
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
