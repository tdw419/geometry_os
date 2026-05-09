; DESCRIPTION: Draws a blue line from (131, 19) to (165, 47).
; PLAN: r0=131(x1), r1=19(y1), r2=165(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 19
LDI r2, 165
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
