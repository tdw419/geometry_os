; DESCRIPTION: Draws a black line from (372, 107) to (348, 230).
; PLAN: r0=372(x1), r1=107(y1), r2=348(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 107
LDI r2, 348
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
