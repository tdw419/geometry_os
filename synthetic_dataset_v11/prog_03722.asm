; DESCRIPTION: Places a green line segment connecting (160, 230) to (80, 158).
; PLAN: r0=160(x1), r1=230(y1), r2=80(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 230
LDI r2, 80
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
