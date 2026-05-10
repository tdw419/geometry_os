; DESCRIPTION: Draws a blue line from (195, 92) to (104, 10).
; PLAN: r0=195(x1), r1=92(y1), r2=104(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 92
LDI r2, 104
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
