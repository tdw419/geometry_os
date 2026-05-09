; DESCRIPTION: Places a red line segment connecting (19, 222) to (231, 45).
; PLAN: r0=19(x1), r1=222(y1), r2=231(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 222
LDI r2, 231
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
