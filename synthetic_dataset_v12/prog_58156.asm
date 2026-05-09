; DESCRIPTION: Renders a purple line between points (6, 172) and (500, 171).
; PLAN: r0=6(x1), r1=172(y1), r2=500(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 172
LDI r2, 500
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
