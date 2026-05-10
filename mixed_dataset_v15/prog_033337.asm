; DESCRIPTION: Renders a purple line between points (303, 167) and (360, 206).
; PLAN: r0=303(x1), r1=167(y1), r2=360(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 167
LDI r2, 360
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
