; DESCRIPTION: Places a yellow line segment connecting (135, 168) to (172, 155).
; PLAN: r0=135(x1), r1=168(y1), r2=172(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 168
LDI r2, 172
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
