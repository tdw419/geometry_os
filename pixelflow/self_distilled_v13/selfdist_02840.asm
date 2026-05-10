; DESCRIPTION: Renders a blue line segment connecting (329, 33) to (184, 151).
; PLAN: r0=329(x1), r1=33(y1), r2=184(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 33
LDI r2, 184
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
