; DESCRIPTION: Draws a blue line from (308, 93) to (110, 141).
; PLAN: r0=308(x1), r1=93(y1), r2=110(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 93
LDI r2, 110
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
