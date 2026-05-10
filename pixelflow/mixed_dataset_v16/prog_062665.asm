; DESCRIPTION: Places a green line segment connecting (449, 97) to (6, 172).
; PLAN: r0=449(x1), r1=97(y1), r2=6(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 97
LDI r2, 6
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
