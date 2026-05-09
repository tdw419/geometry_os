; DESCRIPTION: Places a red line segment connecting (66, 198) to (212, 160).
; PLAN: r0=66(x1), r1=198(y1), r2=212(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 198
LDI r2, 212
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
