; DESCRIPTION: Places a red line segment connecting (46, 80) to (134, 160).
; PLAN: r0=46(x1), r1=80(y1), r2=134(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 80
LDI r2, 134
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
