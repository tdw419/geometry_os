; DESCRIPTION: Renders a purple line between points (222, 164) and (122, 210).
; PLAN: r0=222(x1), r1=164(y1), r2=122(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 164
LDI r2, 122
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
