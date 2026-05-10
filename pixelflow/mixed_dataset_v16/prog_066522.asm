; DESCRIPTION: Places a yellow line segment connecting (453, 133) to (411, 50).
; PLAN: r0=453(x1), r1=133(y1), r2=411(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 133
LDI r2, 411
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
