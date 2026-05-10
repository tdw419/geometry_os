; DESCRIPTION: Draws a blue line from (308, 25) to (508, 75).
; PLAN: r0=308(x1), r1=25(y1), r2=508(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 25
LDI r2, 508
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
