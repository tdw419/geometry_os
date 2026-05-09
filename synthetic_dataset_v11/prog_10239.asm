; DESCRIPTION: Renders a yellow line between points (167, 105) and (199, 137).
; PLAN: r0=167(x1), r1=105(y1), r2=199(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 105
LDI r2, 199
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
