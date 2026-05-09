; DESCRIPTION: Renders a purple line between points (378, 113) and (415, 214).
; PLAN: r0=378(x1), r1=113(y1), r2=415(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 113
LDI r2, 415
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
