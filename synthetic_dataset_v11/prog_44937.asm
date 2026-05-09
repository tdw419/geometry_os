; DESCRIPTION: Draws a blue line from (40, 8) to (139, 214).
; PLAN: r0=40(x1), r1=8(y1), r2=139(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 8
LDI r2, 139
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
