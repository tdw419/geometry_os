; DESCRIPTION: Renders a white line between points (357, 183) and (14, 172).
; PLAN: r0=357(x1), r1=183(y1), r2=14(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 183
LDI r2, 14
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
