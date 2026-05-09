; DESCRIPTION: Draws a blue line from (338, 73) to (424, 169).
; PLAN: r0=338(x1), r1=73(y1), r2=424(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 73
LDI r2, 424
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
