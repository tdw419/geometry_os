; DESCRIPTION: Renders a white line between points (199, 165) and (302, 149).
; PLAN: r0=199(x1), r1=165(y1), r2=302(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 165
LDI r2, 302
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
