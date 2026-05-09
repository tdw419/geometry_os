; DESCRIPTION: Renders a green line between points (1, 17) and (199, 24).
; PLAN: r0=1(x1), r1=17(y1), r2=199(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 17
LDI r2, 199
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
