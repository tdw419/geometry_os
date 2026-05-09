; DESCRIPTION: Draws a blue line from (53, 57) to (455, 122).
; PLAN: r0=53(x1), r1=57(y1), r2=455(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 57
LDI r2, 455
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
