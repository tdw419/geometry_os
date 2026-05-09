; DESCRIPTION: Draws a blue line from (38, 241) to (124, 214).
; PLAN: r0=38(x1), r1=241(y1), r2=124(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 241
LDI r2, 124
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
