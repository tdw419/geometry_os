; DESCRIPTION: Draws a purple line from (477, 44) to (76, 173).
; PLAN: r0=477(x1), r1=44(y1), r2=76(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 44
LDI r2, 76
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
