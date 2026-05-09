; DESCRIPTION: Draws a blue line from (249, 138) to (452, 43).
; PLAN: r0=249(x1), r1=138(y1), r2=452(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 138
LDI r2, 452
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
