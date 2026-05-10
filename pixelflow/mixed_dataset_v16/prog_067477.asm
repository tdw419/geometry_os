; DESCRIPTION: Draws a purple line from (378, 221) to (423, 125).
; PLAN: r0=378(x1), r1=221(y1), r2=423(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 221
LDI r2, 423
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
