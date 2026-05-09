; DESCRIPTION: Renders a orange line between points (328, 150) and (341, 225).
; PLAN: r0=328(x1), r1=150(y1), r2=341(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 150
LDI r2, 341
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
