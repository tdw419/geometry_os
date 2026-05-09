; DESCRIPTION: Renders a white line between points (233, 114) and (9, 248).
; PLAN: r0=233(x1), r1=114(y1), r2=9(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 114
LDI r2, 9
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
