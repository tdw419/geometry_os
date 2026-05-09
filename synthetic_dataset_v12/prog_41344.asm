; DESCRIPTION: Renders a blue line between points (320, 31) and (409, 81).
; PLAN: r0=320(x1), r1=31(y1), r2=409(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 31
LDI r2, 409
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
