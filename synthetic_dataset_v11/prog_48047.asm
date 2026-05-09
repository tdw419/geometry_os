; DESCRIPTION: Renders a red line between points (0, 138) and (97, 67).
; PLAN: r0=0(x1), r1=138(y1), r2=97(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 138
LDI r2, 97
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
