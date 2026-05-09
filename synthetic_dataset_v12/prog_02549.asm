; DESCRIPTION: Draws a blue line from (205, 208) to (452, 238).
; PLAN: r0=205(x1), r1=208(y1), r2=452(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 208
LDI r2, 452
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
