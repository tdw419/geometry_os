; DESCRIPTION: Draws a red line from (137, 21) to (302, 7).
; PLAN: r0=137(x1), r1=21(y1), r2=302(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 21
LDI r2, 302
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
