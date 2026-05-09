; DESCRIPTION: Draws a white line from (85, 71) to (105, 184).
; PLAN: r0=85(x1), r1=71(y1), r2=105(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 71
LDI r2, 105
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
