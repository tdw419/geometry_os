; DESCRIPTION: Places a green line segment connecting (106, 200) to (203, 3).
; PLAN: r0=106(x1), r1=200(y1), r2=203(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 200
LDI r2, 203
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
