; DESCRIPTION: Renders a white line between points (211, 38) and (14, 45).
; PLAN: r0=211(x1), r1=38(y1), r2=14(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 38
LDI r2, 14
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
