; DESCRIPTION: Renders a purple line between points (458, 254) and (384, 206).
; PLAN: r0=458(x1), r1=254(y1), r2=384(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 254
LDI r2, 384
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
