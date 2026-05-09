; DESCRIPTION: Draws a black line from (483, 246) to (176, 248).
; PLAN: r0=483(x1), r1=246(y1), r2=176(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 246
LDI r2, 176
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
