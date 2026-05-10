; DESCRIPTION: Draws a blue line from (255, 35) to (138, 58).
; PLAN: r0=255(x1), r1=35(y1), r2=138(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 35
LDI r2, 138
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
