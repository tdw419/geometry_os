; DESCRIPTION: Places a red line segment connecting (56, 128) to (121, 129).
; PLAN: r0=56(x1), r1=128(y1), r2=121(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 128
LDI r2, 121
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
