; DESCRIPTION: Places a purple line segment connecting (494, 104) to (143, 173).
; PLAN: r0=494(x1), r1=104(y1), r2=143(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 104
LDI r2, 143
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
