; DESCRIPTION: Draws a blue line from (481, 63) to (390, 64).
; PLAN: r0=481(x1), r1=63(y1), r2=390(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 63
LDI r2, 390
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
