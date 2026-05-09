; DESCRIPTION: Places a purple line segment connecting (236, 18) to (338, 196).
; PLAN: r0=236(x1), r1=18(y1), r2=338(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 18
LDI r2, 338
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
