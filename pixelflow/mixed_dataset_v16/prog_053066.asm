; DESCRIPTION: Draws a blue line from (473, 42) to (84, 136).
; PLAN: r0=473(x1), r1=42(y1), r2=84(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 42
LDI r2, 84
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
