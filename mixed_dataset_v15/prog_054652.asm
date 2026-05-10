; DESCRIPTION: Places a white line segment connecting (429, 119) to (462, 115).
; PLAN: r0=429(x1), r1=119(y1), r2=462(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 119
LDI r2, 462
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
