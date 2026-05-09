; DESCRIPTION: Renders a orange line between points (371, 4) and (287, 246).
; PLAN: r0=371(x1), r1=4(y1), r2=287(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 4
LDI r2, 287
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
