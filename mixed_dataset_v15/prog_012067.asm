; DESCRIPTION: Places a yellow line segment connecting (304, 194) to (481, 80).
; PLAN: r0=304(x1), r1=194(y1), r2=481(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 194
LDI r2, 481
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
