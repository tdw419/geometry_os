; DESCRIPTION: Places a red line segment connecting (212, 206) to (188, 64).
; PLAN: r0=212(x1), r1=206(y1), r2=188(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 206
LDI r2, 188
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
