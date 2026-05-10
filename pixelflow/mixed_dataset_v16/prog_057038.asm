; DESCRIPTION: Places a yellow line segment connecting (270, 214) to (105, 26).
; PLAN: r0=270(x1), r1=214(y1), r2=105(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 214
LDI r2, 105
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
