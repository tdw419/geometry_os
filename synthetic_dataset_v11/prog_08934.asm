; DESCRIPTION: Renders a magenta line between points (116, 41) and (31, 21).
; PLAN: r0=116(x1), r1=41(y1), r2=31(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 41
LDI r2, 31
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
