; DESCRIPTION: Renders a purple line between points (176, 215) and (172, 165).
; PLAN: r0=176(x1), r1=215(y1), r2=172(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 215
LDI r2, 172
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
