; DESCRIPTION: Draws a red line from (374, 97) to (477, 238).
; PLAN: r0=374(x1), r1=97(y1), r2=477(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 97
LDI r2, 477
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
