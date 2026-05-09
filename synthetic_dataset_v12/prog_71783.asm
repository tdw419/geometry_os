; DESCRIPTION: Draws a red line from (117, 190) to (302, 83).
; PLAN: r0=117(x1), r1=190(y1), r2=302(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 190
LDI r2, 302
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
