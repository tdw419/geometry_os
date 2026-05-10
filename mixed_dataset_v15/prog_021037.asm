; DESCRIPTION: Renders a purple line between points (352, 29) and (464, 241).
; PLAN: r0=352(x1), r1=29(y1), r2=464(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 29
LDI r2, 464
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
