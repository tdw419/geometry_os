; DESCRIPTION: Places a purple line segment connecting (425, 119) to (5, 171).
; PLAN: r0=425(x1), r1=119(y1), r2=5(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 119
LDI r2, 5
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
