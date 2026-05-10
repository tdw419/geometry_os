; DESCRIPTION: Draws a black line from (276, 174) to (30, 174).
; PLAN: r0=276(x1), r1=174(y1), r2=30(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 174
LDI r2, 30
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
