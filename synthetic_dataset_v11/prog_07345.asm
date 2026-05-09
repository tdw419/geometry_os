; DESCRIPTION: Places a yellow line segment connecting (7, 95) to (241, 48).
; PLAN: r0=7(x1), r1=95(y1), r2=241(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 95
LDI r2, 241
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
