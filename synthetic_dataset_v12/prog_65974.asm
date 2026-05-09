; DESCRIPTION: Places a yellow line segment connecting (262, 2) to (234, 188).
; PLAN: r0=262(x1), r1=2(y1), r2=234(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 2
LDI r2, 234
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
