; DESCRIPTION: Draws a white line from (194, 126) to (200, 56).
; PLAN: r0=194(x1), r1=126(y1), r2=200(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 126
LDI r2, 200
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
