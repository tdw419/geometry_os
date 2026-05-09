; DESCRIPTION: Draws a blue line from (69, 149) to (219, 144).
; PLAN: r0=69(x1), r1=149(y1), r2=219(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 149
LDI r2, 219
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
