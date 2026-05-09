; DESCRIPTION: Places a yellow line segment connecting (434, 84) to (34, 55).
; PLAN: r0=434(x1), r1=84(y1), r2=34(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 84
LDI r2, 34
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
