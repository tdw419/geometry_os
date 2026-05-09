; DESCRIPTION: Renders a purple line between points (38, 46) and (202, 98).
; PLAN: r0=38(x1), r1=46(y1), r2=202(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 46
LDI r2, 202
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
