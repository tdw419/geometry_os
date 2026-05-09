; DESCRIPTION: Draws a green line from (67, 4) to (136, 232).
; PLAN: r0=67(x1), r1=4(y1), r2=136(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 4
LDI r2, 136
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
