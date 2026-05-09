; DESCRIPTION: Places a yellow line segment connecting (276, 179) to (366, 126).
; PLAN: r0=276(x1), r1=179(y1), r2=366(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 179
LDI r2, 366
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
