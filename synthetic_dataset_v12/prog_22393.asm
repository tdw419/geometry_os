; DESCRIPTION: Renders a purple line between points (239, 141) and (299, 121).
; PLAN: r0=239(x1), r1=141(y1), r2=299(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 141
LDI r2, 299
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
