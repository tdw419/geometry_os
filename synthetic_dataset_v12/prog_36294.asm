; DESCRIPTION: Renders a white line between points (0, 82) and (430, 3).
; PLAN: r0=0(x1), r1=82(y1), r2=430(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 82
LDI r2, 430
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
