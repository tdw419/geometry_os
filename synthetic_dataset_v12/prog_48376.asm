; DESCRIPTION: Renders a purple line between points (329, 186) and (332, 194).
; PLAN: r0=329(x1), r1=186(y1), r2=332(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 186
LDI r2, 332
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
