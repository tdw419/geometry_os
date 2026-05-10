; DESCRIPTION: Draws a black line from (307, 133) to (467, 217).
; PLAN: r0=307(x1), r1=133(y1), r2=467(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 133
LDI r2, 467
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
