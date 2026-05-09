; DESCRIPTION: Places a black line segment connecting (176, 162) to (203, 194).
; PLAN: r0=176(x1), r1=162(y1), r2=203(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 162
LDI r2, 203
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
