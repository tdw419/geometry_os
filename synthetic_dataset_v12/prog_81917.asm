; DESCRIPTION: Places a red line segment connecting (63, 12) to (353, 92).
; PLAN: r0=63(x1), r1=12(y1), r2=353(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 12
LDI r2, 353
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
