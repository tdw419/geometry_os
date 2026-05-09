; DESCRIPTION: Places a red line segment connecting (504, 250) to (377, 46).
; PLAN: r0=504(x1), r1=250(y1), r2=377(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 250
LDI r2, 377
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
