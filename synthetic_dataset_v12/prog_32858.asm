; DESCRIPTION: Renders a orange line between points (298, 83) and (342, 60).
; PLAN: r0=298(x1), r1=83(y1), r2=342(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 83
LDI r2, 342
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
