; DESCRIPTION: Places a blue circle of radius 47 at center (167, 158).
; PLAN: r0=167(x), r1=158(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 158
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
