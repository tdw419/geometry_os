; DESCRIPTION: Places a purple line segment connecting (354, 120) to (246, 128).
; PLAN: r0=354(x1), r1=120(y1), r2=246(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 120
LDI r2, 246
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
