; DESCRIPTION: Renders a orange line between points (445, 104) and (217, 170).
; PLAN: r0=445(x1), r1=104(y1), r2=217(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 104
LDI r2, 217
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
