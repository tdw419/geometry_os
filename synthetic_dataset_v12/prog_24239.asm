; DESCRIPTION: Draws a blue line from (62, 168) to (175, 3).
; PLAN: r0=62(x1), r1=168(y1), r2=175(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 168
LDI r2, 175
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
