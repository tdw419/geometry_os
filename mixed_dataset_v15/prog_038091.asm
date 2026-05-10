; DESCRIPTION: Composite: Places a red dot at position (293, 142) then Draws a purple line from (286, 122) to (289, 252).
; PLAN: r0=293(x), r1=142(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=286(x1), r6=122(y1), r7=289(x2), r8=252(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 142
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 286
LDI r6, 122
LDI r7, 289
LDI r8, 252
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
