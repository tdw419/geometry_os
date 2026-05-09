; DESCRIPTION: Places a yellow line segment connecting (435, 160) to (202, 157).
; PLAN: r0=435(x1), r1=160(y1), r2=202(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 160
LDI r2, 202
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
