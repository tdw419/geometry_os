; DESCRIPTION: Draws a red line from (16, 244) to (137, 149).
; PLAN: r0=16(x1), r1=244(y1), r2=137(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 244
LDI r2, 137
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
