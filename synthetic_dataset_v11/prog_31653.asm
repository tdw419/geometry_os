; DESCRIPTION: Renders a blue line between points (28, 128) and (160, 232).
; PLAN: r0=28(x1), r1=128(y1), r2=160(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 128
LDI r2, 160
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
