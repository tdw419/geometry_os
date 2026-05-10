; DESCRIPTION: Renders a white line between points (372, 5) and (343, 65).
; PLAN: r0=372(x1), r1=5(y1), r2=343(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 5
LDI r2, 343
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
