; DESCRIPTION: Draws a blue line from (201, 125) to (333, 95).
; PLAN: r0=201(x1), r1=125(y1), r2=333(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 125
LDI r2, 333
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
