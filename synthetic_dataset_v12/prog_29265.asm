; DESCRIPTION: Draws a blue line from (102, 62) to (241, 160).
; PLAN: r0=102(x1), r1=62(y1), r2=241(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 62
LDI r2, 241
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
