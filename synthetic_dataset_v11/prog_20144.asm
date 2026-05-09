; DESCRIPTION: Renders a black line between points (152, 248) and (183, 118).
; PLAN: r0=152(x1), r1=248(y1), r2=183(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 248
LDI r2, 183
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
