; DESCRIPTION: Places a purple line segment connecting (189, 52) to (98, 231).
; PLAN: r0=189(x1), r1=52(y1), r2=98(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 52
LDI r2, 98
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
