; DESCRIPTION: Draws a blue line from (30, 150) to (95, 233).
; PLAN: r0=30(x1), r1=150(y1), r2=95(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 150
LDI r2, 95
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
