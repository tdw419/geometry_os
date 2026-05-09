; DESCRIPTION: Places a yellow line segment connecting (66, 102) to (381, 5).
; PLAN: r0=66(x1), r1=102(y1), r2=381(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 102
LDI r2, 381
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
