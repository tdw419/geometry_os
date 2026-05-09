; DESCRIPTION: Places a green line segment connecting (230, 219) to (221, 88).
; PLAN: r0=230(x1), r1=219(y1), r2=221(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 219
LDI r2, 221
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
