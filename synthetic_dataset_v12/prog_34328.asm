; DESCRIPTION: Renders a white line between points (199, 157) and (58, 34).
; PLAN: r0=199(x1), r1=157(y1), r2=58(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 157
LDI r2, 58
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
