; DESCRIPTION: Draws a blue line from (481, 233) to (58, 118).
; PLAN: r0=481(x1), r1=233(y1), r2=58(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 233
LDI r2, 58
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
