; DESCRIPTION: Renders a green line segment connecting (120, 122) to (232, 128).
; PLAN: r0=120(x1), r1=122(y1), r2=232(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 122
LDI r2, 232
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
