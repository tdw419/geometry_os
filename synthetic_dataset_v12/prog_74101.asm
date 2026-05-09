; DESCRIPTION: Renders a purple line between points (266, 146) and (90, 171).
; PLAN: r0=266(x1), r1=146(y1), r2=90(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 146
LDI r2, 90
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
