; DESCRIPTION: Places a green line segment connecting (176, 26) to (234, 218).
; PLAN: r0=176(x1), r1=26(y1), r2=234(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 26
LDI r2, 234
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
