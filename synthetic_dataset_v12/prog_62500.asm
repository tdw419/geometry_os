; DESCRIPTION: Draws a blue line from (441, 65) to (64, 2).
; PLAN: r0=441(x1), r1=65(y1), r2=64(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 65
LDI r2, 64
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
