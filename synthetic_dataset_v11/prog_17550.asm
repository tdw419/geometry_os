; DESCRIPTION: Draws a blue line from (131, 58) to (43, 64).
; PLAN: r0=131(x1), r1=58(y1), r2=43(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 58
LDI r2, 43
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
