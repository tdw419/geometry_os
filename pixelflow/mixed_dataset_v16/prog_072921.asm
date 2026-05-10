; DESCRIPTION: Places a yellow line segment connecting (358, 107) to (126, 203).
; PLAN: r0=358(x1), r1=107(y1), r2=126(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 107
LDI r2, 126
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
