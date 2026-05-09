; DESCRIPTION: Places a white line segment connecting (150, 35) to (508, 74).
; PLAN: r0=150(x1), r1=35(y1), r2=508(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 35
LDI r2, 508
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
