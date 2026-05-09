; DESCRIPTION: Renders a purple line between points (510, 67) and (161, 241).
; PLAN: r0=510(x1), r1=67(y1), r2=161(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 67
LDI r2, 161
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
