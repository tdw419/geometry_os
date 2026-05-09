; DESCRIPTION: Renders a blue line between points (499, 237) and (379, 40).
; PLAN: r0=499(x1), r1=237(y1), r2=379(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 237
LDI r2, 379
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
