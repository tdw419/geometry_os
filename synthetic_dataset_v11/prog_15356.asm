; DESCRIPTION: Renders a purple line between points (254, 128) and (122, 134).
; PLAN: r0=254(x1), r1=128(y1), r2=122(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 128
LDI r2, 122
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
