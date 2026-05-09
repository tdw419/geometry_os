; DESCRIPTION: Places a white line segment connecting (425, 72) to (385, 145).
; PLAN: r0=425(x1), r1=72(y1), r2=385(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 72
LDI r2, 385
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
