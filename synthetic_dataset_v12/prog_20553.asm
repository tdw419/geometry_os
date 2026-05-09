; DESCRIPTION: Renders a orange line between points (403, 33) and (199, 219).
; PLAN: r0=403(x1), r1=33(y1), r2=199(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 33
LDI r2, 199
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
