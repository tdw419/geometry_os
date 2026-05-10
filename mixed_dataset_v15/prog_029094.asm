; DESCRIPTION: Renders a orange line between points (199, 38) and (460, 76).
; PLAN: r0=199(x1), r1=38(y1), r2=460(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 38
LDI r2, 460
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
