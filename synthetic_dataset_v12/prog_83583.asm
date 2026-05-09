; DESCRIPTION: Places a blue circle of radius 35 at center (140, 166).
; PLAN: r0=140(x), r1=166(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 166
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
