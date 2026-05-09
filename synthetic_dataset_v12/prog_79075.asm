; DESCRIPTION: Renders a purple line between points (318, 69) and (215, 250).
; PLAN: r0=318(x1), r1=69(y1), r2=215(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 69
LDI r2, 215
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
