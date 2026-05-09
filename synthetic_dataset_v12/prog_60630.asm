; DESCRIPTION: Places a yellow line segment connecting (411, 59) to (230, 80).
; PLAN: r0=411(x1), r1=59(y1), r2=230(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 59
LDI r2, 230
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
