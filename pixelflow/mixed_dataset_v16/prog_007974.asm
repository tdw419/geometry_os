; DESCRIPTION: Draws a black line from (276, 52) to (508, 101).
; PLAN: r0=276(x1), r1=52(y1), r2=508(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 52
LDI r2, 508
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
