; DESCRIPTION: Draws a black line from (276, 34) to (509, 61).
; PLAN: r0=276(x1), r1=34(y1), r2=509(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 34
LDI r2, 509
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
