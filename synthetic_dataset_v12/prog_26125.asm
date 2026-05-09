; DESCRIPTION: Renders a purple line between points (283, 9) and (230, 187).
; PLAN: r0=283(x1), r1=9(y1), r2=230(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 9
LDI r2, 230
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
