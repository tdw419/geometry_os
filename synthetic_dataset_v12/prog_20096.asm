; DESCRIPTION: Places a red line segment connecting (117, 130) to (490, 9).
; PLAN: r0=117(x1), r1=130(y1), r2=490(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 130
LDI r2, 490
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
