; DESCRIPTION: Draws a white line from (139, 17) to (105, 73).
; PLAN: r0=139(x1), r1=17(y1), r2=105(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 17
LDI r2, 105
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
