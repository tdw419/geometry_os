; DESCRIPTION: Renders a purple line between points (384, 229) and (38, 68).
; PLAN: r0=384(x1), r1=229(y1), r2=38(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 229
LDI r2, 38
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
