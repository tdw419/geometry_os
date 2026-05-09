; DESCRIPTION: Draws a blue line from (14, 231) to (153, 214).
; PLAN: r0=14(x1), r1=231(y1), r2=153(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 231
LDI r2, 153
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
