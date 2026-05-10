; DESCRIPTION: Draws a white line from (172, 34) to (15, 76).
; PLAN: r0=172(x1), r1=34(y1), r2=15(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 34
LDI r2, 15
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
