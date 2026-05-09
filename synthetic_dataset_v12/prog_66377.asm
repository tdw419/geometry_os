; DESCRIPTION: Places a yellow line segment connecting (208, 160) to (53, 153).
; PLAN: r0=208(x1), r1=160(y1), r2=53(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 160
LDI r2, 53
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
