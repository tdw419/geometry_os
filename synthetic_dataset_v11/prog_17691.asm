; DESCRIPTION: Places a green line segment connecting (231, 18) to (31, 7).
; PLAN: r0=231(x1), r1=18(y1), r2=31(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 18
LDI r2, 31
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
