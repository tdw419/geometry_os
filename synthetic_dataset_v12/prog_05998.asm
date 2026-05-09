; DESCRIPTION: Places a red line segment connecting (244, 253) to (212, 231).
; PLAN: r0=244(x1), r1=253(y1), r2=212(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 253
LDI r2, 212
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
