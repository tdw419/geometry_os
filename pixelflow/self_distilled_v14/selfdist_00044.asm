; DESCRIPTION: Draws a blue line from (64, 198) to (184, 28).
; PLAN: r0=64(x1), r1=198(y1), r2=184(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 198
LDI r2, 184
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
