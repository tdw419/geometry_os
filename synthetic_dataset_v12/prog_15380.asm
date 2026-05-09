; DESCRIPTION: Renders a orange line between points (271, 112) and (104, 178).
; PLAN: r0=271(x1), r1=112(y1), r2=104(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 112
LDI r2, 104
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
