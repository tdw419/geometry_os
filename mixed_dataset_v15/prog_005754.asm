; DESCRIPTION: Renders a orange line between points (199, 196) and (96, 55).
; PLAN: r0=199(x1), r1=196(y1), r2=96(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 196
LDI r2, 96
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
