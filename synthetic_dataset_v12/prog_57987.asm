; DESCRIPTION: Places a red line segment connecting (211, 160) to (109, 222).
; PLAN: r0=211(x1), r1=160(y1), r2=109(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 160
LDI r2, 109
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
