; DESCRIPTION: Renders a purple line between points (171, 183) and (25, 248).
; PLAN: r0=171(x1), r1=183(y1), r2=25(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 183
LDI r2, 25
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
