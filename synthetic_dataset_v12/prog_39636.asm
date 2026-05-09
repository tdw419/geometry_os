; DESCRIPTION: Draws a blue line from (469, 140) to (65, 19).
; PLAN: r0=469(x1), r1=140(y1), r2=65(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 140
LDI r2, 65
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
