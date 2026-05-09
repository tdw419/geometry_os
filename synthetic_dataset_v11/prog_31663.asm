; DESCRIPTION: Draws a white line from (162, 119) to (131, 89).
; PLAN: r0=162(x1), r1=119(y1), r2=131(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 119
LDI r2, 131
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
