; DESCRIPTION: Renders a orange line between points (226, 116) and (453, 237).
; PLAN: r0=226(x1), r1=116(y1), r2=453(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 116
LDI r2, 453
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
