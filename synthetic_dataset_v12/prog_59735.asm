; DESCRIPTION: Draws a blue line from (380, 0) to (452, 211).
; PLAN: r0=380(x1), r1=0(y1), r2=452(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 0
LDI r2, 452
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
