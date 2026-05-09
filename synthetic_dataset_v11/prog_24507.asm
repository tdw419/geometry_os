; DESCRIPTION: Renders a orange line between points (199, 67) and (230, 15).
; PLAN: r0=199(x1), r1=67(y1), r2=230(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 67
LDI r2, 230
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
