; DESCRIPTION: Places a purple line segment connecting (240, 217) to (179, 27).
; PLAN: r0=240(x1), r1=217(y1), r2=179(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 217
LDI r2, 179
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
