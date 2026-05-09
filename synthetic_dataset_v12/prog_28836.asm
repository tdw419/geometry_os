; DESCRIPTION: Draws a blue line from (387, 165) to (416, 212).
; PLAN: r0=387(x1), r1=165(y1), r2=416(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 165
LDI r2, 416
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
