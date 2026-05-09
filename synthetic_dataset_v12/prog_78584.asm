; DESCRIPTION: Draws a blue line from (119, 115) to (219, 178).
; PLAN: r0=119(x1), r1=115(y1), r2=219(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 115
LDI r2, 219
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
