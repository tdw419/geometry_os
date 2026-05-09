; DESCRIPTION: Places a yellow line segment connecting (232, 230) to (154, 36).
; PLAN: r0=232(x1), r1=230(y1), r2=154(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 230
LDI r2, 154
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
