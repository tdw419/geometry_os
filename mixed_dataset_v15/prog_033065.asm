; DESCRIPTION: Places a yellow line segment connecting (434, 95) to (19, 191).
; PLAN: r0=434(x1), r1=95(y1), r2=19(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 95
LDI r2, 19
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
