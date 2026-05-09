; DESCRIPTION: Places a red line segment connecting (196, 189) to (29, 56).
; PLAN: r0=196(x1), r1=189(y1), r2=29(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 189
LDI r2, 29
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
