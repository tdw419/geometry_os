; DESCRIPTION: Renders a purple line between points (327, 7) and (9, 248).
; PLAN: r0=327(x1), r1=7(y1), r2=9(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 7
LDI r2, 9
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
