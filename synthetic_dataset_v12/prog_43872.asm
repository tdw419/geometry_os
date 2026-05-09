; DESCRIPTION: Places a red line segment connecting (137, 170) to (493, 152).
; PLAN: r0=137(x1), r1=170(y1), r2=493(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 170
LDI r2, 493
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
