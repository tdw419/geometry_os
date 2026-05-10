; DESCRIPTION: Draws a purple line from (241, 18) to (285, 34).
; PLAN: r0=241(x1), r1=18(y1), r2=285(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 18
LDI r2, 285
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
