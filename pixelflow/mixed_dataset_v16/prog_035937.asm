; DESCRIPTION: Renders a orange line between points (38, 246) and (342, 13).
; PLAN: r0=38(x1), r1=246(y1), r2=342(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 246
LDI r2, 342
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
