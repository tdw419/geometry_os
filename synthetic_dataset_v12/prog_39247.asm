; DESCRIPTION: Renders a orange line between points (320, 165) and (341, 104).
; PLAN: r0=320(x1), r1=165(y1), r2=341(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 165
LDI r2, 341
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
