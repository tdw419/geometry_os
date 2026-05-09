; DESCRIPTION: Draws a blue line from (498, 4) to (424, 72).
; PLAN: r0=498(x1), r1=4(y1), r2=424(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 4
LDI r2, 424
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
