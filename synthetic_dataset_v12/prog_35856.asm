; DESCRIPTION: Draws a blue line from (452, 204) to (481, 62).
; PLAN: r0=452(x1), r1=204(y1), r2=481(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 204
LDI r2, 481
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
