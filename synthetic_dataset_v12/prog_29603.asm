; DESCRIPTION: Draws a blue line from (161, 153) to (276, 218).
; PLAN: r0=161(x1), r1=153(y1), r2=276(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 153
LDI r2, 276
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
