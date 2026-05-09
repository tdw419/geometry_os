; DESCRIPTION: Places a white line segment connecting (163, 108) to (151, 249).
; PLAN: r0=163(x1), r1=108(y1), r2=151(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 108
LDI r2, 151
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
