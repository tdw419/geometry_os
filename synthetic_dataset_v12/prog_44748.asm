; DESCRIPTION: Draws a blue line from (175, 53) to (194, 202).
; PLAN: r0=175(x1), r1=53(y1), r2=194(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 53
LDI r2, 194
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
