; DESCRIPTION: Places a yellow line segment connecting (26, 130) to (110, 196).
; PLAN: r0=26(x1), r1=130(y1), r2=110(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 130
LDI r2, 110
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
