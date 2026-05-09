; DESCRIPTION: Composite: . Then Places a blue dot at position (79, 30). Then Places a purple line segment connecting (128, 240) to (5, 56).
; PLAN: r0=79(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=128(x1), r1=240(y1), r2=5(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (79, 30).
; PLAN: r0=79(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 30
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple line segment connecting (128, 240) to (5, 56).
; PLAN: r0=128(x1), r1=240(y1), r2=5(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 240
LDI r2, 5
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
