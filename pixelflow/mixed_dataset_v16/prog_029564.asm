; DESCRIPTION: Draws a blue line from (36, 4) to (104, 51).
; PLAN: r0=36(x1), r1=4(y1), r2=104(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 4
LDI r2, 104
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
