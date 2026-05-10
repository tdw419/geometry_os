; DESCRIPTION: Renders a purple line between points (245, 244) and (18, 255).
; PLAN: r0=245(x1), r1=244(y1), r2=18(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 244
LDI r2, 18
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
