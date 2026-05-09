; DESCRIPTION: Renders a purple line between points (62, 39) and (202, 41).
; PLAN: r0=62(x1), r1=39(y1), r2=202(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 39
LDI r2, 202
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
