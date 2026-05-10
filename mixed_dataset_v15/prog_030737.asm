; DESCRIPTION: Draws a purple line from (375, 236) to (125, 102).
; PLAN: r0=375(x1), r1=236(y1), r2=125(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 236
LDI r2, 125
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
