; DESCRIPTION: Places a yellow line segment connecting (138, 125) to (482, 1).
; PLAN: r0=138(x1), r1=125(y1), r2=482(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 125
LDI r2, 482
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
