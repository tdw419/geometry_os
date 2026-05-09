; DESCRIPTION: Draws a blue line from (381, 69) to (84, 32).
; PLAN: r0=381(x1), r1=69(y1), r2=84(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 69
LDI r2, 84
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
