; DESCRIPTION: Draws a white line from (345, 119) to (311, 120).
; PLAN: r0=345(x1), r1=119(y1), r2=311(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 119
LDI r2, 311
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
