; DESCRIPTION: Draws a purple line from (38, 142) to (378, 171).
; PLAN: r0=38(x1), r1=142(y1), r2=378(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 142
LDI r2, 378
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
