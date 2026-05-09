; DESCRIPTION: Composite: . Then Places a red dot at position (128, 30). Then Places a purple line segment connecting (56, 56) to (9, 85).
; PLAN: r0=128(x), r1=30(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=56(x1), r1=56(y1), r2=9(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (128, 30).
; PLAN: r0=128(x), r1=30(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 30
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (56, 56) to (9, 85).
; PLAN: r0=56(x1), r1=56(y1), r2=9(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 56
LDI r2, 9
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
