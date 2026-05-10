; DESCRIPTION: Renders a white line between points (109, 24) and (102, 114).
; PLAN: r0=109(x1), r1=24(y1), r2=102(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 24
LDI r2, 102
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
