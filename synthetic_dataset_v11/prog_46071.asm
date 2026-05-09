; DESCRIPTION: Draws a blue line from (121, 30) to (65, 26).
; PLAN: r0=121(x1), r1=30(y1), r2=65(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 30
LDI r2, 65
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
