; DESCRIPTION: Places a yellow line segment connecting (55, 15) to (32, 209).
; PLAN: r0=55(x1), r1=15(y1), r2=32(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 15
LDI r2, 32
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
