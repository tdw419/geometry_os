; DESCRIPTION: Places a yellow line segment connecting (236, 48) to (231, 252).
; PLAN: r0=236(x1), r1=48(y1), r2=231(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 48
LDI r2, 231
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
