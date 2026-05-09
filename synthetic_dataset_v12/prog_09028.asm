; DESCRIPTION: Renders a purple line between points (164, 84) and (222, 195).
; PLAN: r0=164(x1), r1=84(y1), r2=222(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 84
LDI r2, 222
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
