; DESCRIPTION: Draws a white line from (31, 40) to (458, 62).
; PLAN: r0=31(x1), r1=40(y1), r2=458(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 40
LDI r2, 458
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
