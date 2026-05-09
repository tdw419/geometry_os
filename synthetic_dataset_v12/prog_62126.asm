; DESCRIPTION: Draws a red line from (433, 244) to (99, 202).
; PLAN: r0=433(x1), r1=244(y1), r2=99(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 244
LDI r2, 99
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
