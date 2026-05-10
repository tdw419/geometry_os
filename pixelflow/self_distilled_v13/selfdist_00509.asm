; DESCRIPTION: Renders a blue line segment connecting (64, 52) to (276, 8).
; PLAN: r0=64(x1), r1=52(y1), r2=276(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 52
LDI r2, 276
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
