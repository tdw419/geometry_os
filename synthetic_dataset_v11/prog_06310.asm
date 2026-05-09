; DESCRIPTION: Renders a white line between points (183, 12) and (102, 248).
; PLAN: r0=183(x1), r1=12(y1), r2=102(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 12
LDI r2, 102
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
