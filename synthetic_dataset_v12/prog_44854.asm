; DESCRIPTION: Draws a white line from (310, 248) to (341, 185).
; PLAN: r0=310(x1), r1=248(y1), r2=341(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 248
LDI r2, 341
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
