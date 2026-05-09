; DESCRIPTION: Places a blue line segment connecting (115, 187) to (203, 17).
; PLAN: r0=115(x1), r1=187(y1), r2=203(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 187
LDI r2, 203
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
