; DESCRIPTION: Places a white line segment connecting (475, 19) to (377, 0).
; PLAN: r0=475(x1), r1=19(y1), r2=377(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 19
LDI r2, 377
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
