; DESCRIPTION: Renders a blue line between points (199, 31) and (16, 73).
; PLAN: r0=199(x1), r1=31(y1), r2=16(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 31
LDI r2, 16
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
