; DESCRIPTION: Renders a white line between points (82, 167) and (102, 12).
; PLAN: r0=82(x1), r1=167(y1), r2=102(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 167
LDI r2, 102
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
