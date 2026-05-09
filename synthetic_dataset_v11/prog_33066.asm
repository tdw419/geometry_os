; DESCRIPTION: Places a green line segment connecting (203, 162) to (96, 13).
; PLAN: r0=203(x1), r1=162(y1), r2=96(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 162
LDI r2, 96
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
