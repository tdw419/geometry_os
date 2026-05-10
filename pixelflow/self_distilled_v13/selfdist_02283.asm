; DESCRIPTION: Renders a blue line segment connecting (320, 94) to (334, 63).
; PLAN: r0=320(x1), r1=94(y1), r2=334(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 94
LDI r2, 334
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
