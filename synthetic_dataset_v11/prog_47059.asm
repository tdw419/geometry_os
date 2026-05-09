; DESCRIPTION: Draws a blue line from (238, 151) to (68, 234).
; PLAN: r0=238(x1), r1=151(y1), r2=68(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 151
LDI r2, 68
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
