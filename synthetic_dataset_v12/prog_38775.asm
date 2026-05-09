; DESCRIPTION: Renders a green line between points (222, 67) and (232, 43).
; PLAN: r0=222(x1), r1=67(y1), r2=232(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 67
LDI r2, 232
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
