; DESCRIPTION: Renders a white line between points (167, 81) and (47, 156).
; PLAN: r0=167(x1), r1=81(y1), r2=47(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 81
LDI r2, 47
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
