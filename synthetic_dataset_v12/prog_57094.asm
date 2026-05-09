; DESCRIPTION: Draws a white line from (118, 50) to (312, 76).
; PLAN: r0=118(x1), r1=50(y1), r2=312(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 50
LDI r2, 312
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
