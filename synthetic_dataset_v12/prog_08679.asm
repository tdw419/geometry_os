; DESCRIPTION: Draws a white line from (8, 17) to (266, 211).
; PLAN: r0=8(x1), r1=17(y1), r2=266(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 17
LDI r2, 266
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
