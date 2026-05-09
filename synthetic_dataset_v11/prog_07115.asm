; DESCRIPTION: Renders a white line between points (85, 71) and (82, 31).
; PLAN: r0=85(x1), r1=71(y1), r2=82(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 71
LDI r2, 82
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
