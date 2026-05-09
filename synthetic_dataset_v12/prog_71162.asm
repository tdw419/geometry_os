; DESCRIPTION: Draws a blue line from (406, 131) to (424, 5).
; PLAN: r0=406(x1), r1=131(y1), r2=424(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 131
LDI r2, 424
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
