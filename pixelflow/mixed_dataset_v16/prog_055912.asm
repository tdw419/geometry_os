; DESCRIPTION: Renders a purple line between points (215, 35) and (28, 135).
; PLAN: r0=215(x1), r1=35(y1), r2=28(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 35
LDI r2, 28
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
