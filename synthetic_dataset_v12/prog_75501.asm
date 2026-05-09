; DESCRIPTION: Draws a black line from (413, 11) to (0, 122).
; PLAN: r0=413(x1), r1=11(y1), r2=0(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 11
LDI r2, 0
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
