; DESCRIPTION: Renders a blue line between points (320, 119) and (64, 52).
; PLAN: r0=320(x1), r1=119(y1), r2=64(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 119
LDI r2, 64
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
