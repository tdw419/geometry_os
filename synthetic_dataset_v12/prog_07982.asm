; DESCRIPTION: Renders a red line between points (167, 138) and (140, 122).
; PLAN: r0=167(x1), r1=138(y1), r2=140(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 138
LDI r2, 140
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
