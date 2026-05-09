; DESCRIPTION: Places a blue circle of radius 57 at center (115, 167).
; PLAN: r0=115(x), r1=167(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 167
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
