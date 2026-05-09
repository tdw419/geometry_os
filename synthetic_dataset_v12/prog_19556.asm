; DESCRIPTION: Draws a blue line from (241, 141) to (135, 18).
; PLAN: r0=241(x1), r1=141(y1), r2=135(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 141
LDI r2, 135
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
