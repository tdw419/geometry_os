; DESCRIPTION: Draws a red line from (96, 140) to (302, 140).
; PLAN: r0=96(x1), r1=140(y1), r2=302(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 140
LDI r2, 302
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
