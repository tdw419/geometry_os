; DESCRIPTION: Places a yellow line segment connecting (204, 164) to (366, 203).
; PLAN: r0=204(x1), r1=164(y1), r2=366(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 164
LDI r2, 366
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
