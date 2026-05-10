; DESCRIPTION: Draws a white line from (56, 3) to (211, 116).
; PLAN: r0=56(x1), r1=3(y1), r2=211(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 3
LDI r2, 211
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
