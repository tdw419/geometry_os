; DESCRIPTION: Renders a blue line segment connecting (19, 151) to (397, 12).
; PLAN: r0=19(x1), r1=151(y1), r2=397(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 151
LDI r2, 397
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
