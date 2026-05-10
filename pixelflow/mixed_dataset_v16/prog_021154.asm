; DESCRIPTION: Renders a blue line segment connecting (396, 63) to (209, 128).
; PLAN: r0=396(x1), r1=63(y1), r2=209(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 63
LDI r2, 209
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
