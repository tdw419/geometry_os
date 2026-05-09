; DESCRIPTION: Draws a blue line from (120, 232) to (146, 133).
; PLAN: r0=120(x1), r1=232(y1), r2=146(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 232
LDI r2, 146
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
