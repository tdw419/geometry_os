; DESCRIPTION: Places a red line segment connecting (9, 0) to (196, 17).
; PLAN: r0=9(x1), r1=0(y1), r2=196(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 0
LDI r2, 196
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
