; DESCRIPTION: Places a white line segment connecting (98, 51) to (252, 139).
; PLAN: r0=98(x1), r1=51(y1), r2=252(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 51
LDI r2, 252
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
