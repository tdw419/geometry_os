; DESCRIPTION: Renders a purple line between points (363, 165) and (352, 83).
; PLAN: r0=363(x1), r1=165(y1), r2=352(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 165
LDI r2, 352
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
