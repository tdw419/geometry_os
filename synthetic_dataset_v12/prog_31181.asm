; DESCRIPTION: Draws a blue line from (131, 164) to (92, 251).
; PLAN: r0=131(x1), r1=164(y1), r2=92(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 164
LDI r2, 92
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
