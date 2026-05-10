; DESCRIPTION: Places a red line segment connecting (231, 234) to (212, 225).
; PLAN: r0=231(x1), r1=234(y1), r2=212(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 234
LDI r2, 212
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
