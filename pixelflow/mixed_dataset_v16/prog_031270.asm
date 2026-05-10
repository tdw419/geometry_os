; DESCRIPTION: Places a yellow line segment connecting (304, 84) to (383, 48).
; PLAN: r0=304(x1), r1=84(y1), r2=383(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 84
LDI r2, 383
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
