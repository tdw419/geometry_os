; DESCRIPTION: Draws a blue line from (102, 249) to (153, 161).
; PLAN: r0=102(x1), r1=249(y1), r2=153(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 249
LDI r2, 153
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
