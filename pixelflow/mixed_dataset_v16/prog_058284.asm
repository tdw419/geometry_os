; DESCRIPTION: Draws a blue line from (363, 83) to (311, 115).
; PLAN: r0=363(x1), r1=83(y1), r2=311(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 83
LDI r2, 311
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
