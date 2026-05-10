; DESCRIPTION: Renders a white line between points (184, 124) and (302, 137).
; PLAN: r0=184(x1), r1=124(y1), r2=302(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 124
LDI r2, 302
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
