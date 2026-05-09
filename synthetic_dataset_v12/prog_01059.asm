; DESCRIPTION: Draws a blue line from (424, 132) to (225, 92).
; PLAN: r0=424(x1), r1=132(y1), r2=225(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 132
LDI r2, 225
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
