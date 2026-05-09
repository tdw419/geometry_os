; DESCRIPTION: Draws a blue line from (84, 166) to (397, 74).
; PLAN: r0=84(x1), r1=166(y1), r2=397(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 166
LDI r2, 397
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
