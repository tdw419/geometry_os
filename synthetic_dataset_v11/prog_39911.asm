; DESCRIPTION: Renders a cyan line between points (11, 200) and (199, 159).
; PLAN: r0=11(x1), r1=200(y1), r2=199(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 200
LDI r2, 199
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
