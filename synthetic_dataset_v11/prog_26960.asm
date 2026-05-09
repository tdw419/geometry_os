; DESCRIPTION: Places a red line segment connecting (196, 222) to (25, 217).
; PLAN: r0=196(x1), r1=222(y1), r2=25(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 222
LDI r2, 25
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
