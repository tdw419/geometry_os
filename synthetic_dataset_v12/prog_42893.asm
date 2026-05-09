; DESCRIPTION: Renders a orange line between points (139, 206) and (160, 7).
; PLAN: r0=139(x1), r1=206(y1), r2=160(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 206
LDI r2, 160
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
