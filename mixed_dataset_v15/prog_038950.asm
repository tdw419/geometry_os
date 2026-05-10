; DESCRIPTION: Places a yellow line segment connecting (492, 80) to (20, 172).
; PLAN: r0=492(x1), r1=80(y1), r2=20(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 80
LDI r2, 20
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
