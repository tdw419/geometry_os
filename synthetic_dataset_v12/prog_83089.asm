; DESCRIPTION: Draws a blue line from (405, 82) to (19, 155).
; PLAN: r0=405(x1), r1=82(y1), r2=19(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 82
LDI r2, 19
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
