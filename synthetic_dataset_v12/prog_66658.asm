; DESCRIPTION: Places a yellow line segment connecting (72, 121) to (114, 21).
; PLAN: r0=72(x1), r1=121(y1), r2=114(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 121
LDI r2, 114
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
