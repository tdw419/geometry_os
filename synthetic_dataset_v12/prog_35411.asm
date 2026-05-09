; DESCRIPTION: Draws a white line from (194, 36) to (340, 78).
; PLAN: r0=194(x1), r1=36(y1), r2=340(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 36
LDI r2, 340
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
