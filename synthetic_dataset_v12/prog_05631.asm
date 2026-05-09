; DESCRIPTION: Places a green line segment connecting (504, 57) to (317, 149).
; PLAN: r0=504(x1), r1=57(y1), r2=317(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 57
LDI r2, 317
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
