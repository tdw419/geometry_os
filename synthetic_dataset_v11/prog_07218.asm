; DESCRIPTION: Draws a white line from (15, 251) to (237, 1).
; PLAN: r0=15(x1), r1=251(y1), r2=237(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 251
LDI r2, 237
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
