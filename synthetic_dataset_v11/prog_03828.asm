; DESCRIPTION: Draws a blue line from (141, 82) to (172, 131).
; PLAN: r0=141(x1), r1=82(y1), r2=172(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 82
LDI r2, 172
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
