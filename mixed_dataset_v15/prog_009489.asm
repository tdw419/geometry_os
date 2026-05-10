; DESCRIPTION: Renders a orange line between points (253, 237) and (250, 243).
; PLAN: r0=253(x1), r1=237(y1), r2=250(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 237
LDI r2, 250
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
