; DESCRIPTION: Draws a blue line from (87, 244) to (349, 219).
; PLAN: r0=87(x1), r1=244(y1), r2=349(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 244
LDI r2, 349
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
