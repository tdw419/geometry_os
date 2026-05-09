; DESCRIPTION: Renders a green line between points (199, 40) and (35, 225).
; PLAN: r0=199(x1), r1=40(y1), r2=35(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 40
LDI r2, 35
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
