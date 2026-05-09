; DESCRIPTION: Places a purple line segment connecting (195, 173) to (212, 25).
; PLAN: r0=195(x1), r1=173(y1), r2=212(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 173
LDI r2, 212
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
