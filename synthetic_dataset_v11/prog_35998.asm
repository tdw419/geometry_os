; DESCRIPTION: Places a red line segment connecting (219, 174) to (191, 157).
; PLAN: r0=219(x1), r1=174(y1), r2=191(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 174
LDI r2, 191
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
