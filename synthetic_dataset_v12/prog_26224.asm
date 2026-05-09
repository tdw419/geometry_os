; DESCRIPTION: Places a white line segment connecting (323, 132) to (511, 11).
; PLAN: r0=323(x1), r1=132(y1), r2=511(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 132
LDI r2, 511
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
