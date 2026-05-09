; DESCRIPTION: Places a yellow line segment connecting (360, 212) to (40, 209).
; PLAN: r0=360(x1), r1=212(y1), r2=40(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 212
LDI r2, 40
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
