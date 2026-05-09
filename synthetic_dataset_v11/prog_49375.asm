; DESCRIPTION: Creates a blue circular shape at (127, 171) with radius 53.
; PLAN: r0=127(x), r1=171(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 171
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
