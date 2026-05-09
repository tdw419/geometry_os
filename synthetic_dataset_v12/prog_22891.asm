; DESCRIPTION: Places a yellow line segment connecting (154, 219) to (416, 212).
; PLAN: r0=154(x1), r1=219(y1), r2=416(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 219
LDI r2, 416
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
