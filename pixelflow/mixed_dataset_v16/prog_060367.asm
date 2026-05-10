; DESCRIPTION: Places a yellow line segment connecting (123, 220) to (500, 64).
; PLAN: r0=123(x1), r1=220(y1), r2=500(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 220
LDI r2, 500
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
