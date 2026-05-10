; DESCRIPTION: Renders a orange line between points (445, 110) and (342, 214).
; PLAN: r0=445(x1), r1=110(y1), r2=342(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 110
LDI r2, 342
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
