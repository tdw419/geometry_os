; DESCRIPTION: Renders a purple line between points (320, 254) and (0, 138).
; PLAN: r0=320(x1), r1=254(y1), r2=0(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 254
LDI r2, 0
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
