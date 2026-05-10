; DESCRIPTION: Draws a red line from (111, 140) to (469, 96).
; PLAN: r0=111(x1), r1=140(y1), r2=469(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 140
LDI r2, 469
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
