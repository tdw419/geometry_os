; DESCRIPTION: Renders a orange line between points (465, 19) and (104, 70).
; PLAN: r0=465(x1), r1=19(y1), r2=104(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 19
LDI r2, 104
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
