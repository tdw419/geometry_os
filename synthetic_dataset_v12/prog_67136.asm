; DESCRIPTION: Draws a red line from (244, 234) to (388, 35).
; PLAN: r0=244(x1), r1=234(y1), r2=388(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 234
LDI r2, 388
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
