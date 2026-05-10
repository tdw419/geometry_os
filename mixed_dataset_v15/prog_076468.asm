; DESCRIPTION: Places a blue circle of radius 15 at center (463, 27).
; PLAN: r0=463(x), r1=27(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 27
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
