; DESCRIPTION: Renders a blue line segment connecting (60, 77) to (384, 56).
; PLAN: r0=60(x1), r1=77(y1), r2=384(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 77
LDI r2, 384
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
