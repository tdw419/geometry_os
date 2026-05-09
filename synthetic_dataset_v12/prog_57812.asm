; DESCRIPTION: Draws a red line from (245, 157) to (349, 200).
; PLAN: r0=245(x1), r1=157(y1), r2=349(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 157
LDI r2, 349
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
