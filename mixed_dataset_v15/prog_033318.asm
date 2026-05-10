; DESCRIPTION: Draws a red line from (477, 133) to (384, 238).
; PLAN: r0=477(x1), r1=133(y1), r2=384(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 133
LDI r2, 384
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
