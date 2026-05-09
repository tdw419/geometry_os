; DESCRIPTION: Draws a purple line from (129, 67) to (46, 116).
; PLAN: r0=129(x1), r1=67(y1), r2=46(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 67
LDI r2, 46
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
