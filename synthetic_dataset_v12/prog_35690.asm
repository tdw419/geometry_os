; DESCRIPTION: Places a blue circle of radius 69 at center (158, 180).
; PLAN: r0=158(x), r1=180(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 180
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
