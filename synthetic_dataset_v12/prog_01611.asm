; DESCRIPTION: Draws a yellow line from (181, 190) to (236, 76).
; PLAN: r0=181(x1), r1=190(y1), r2=236(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 190
LDI r2, 236
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
