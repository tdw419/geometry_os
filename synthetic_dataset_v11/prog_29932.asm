; DESCRIPTION: Creates a blue circular shape at (123, 111) with radius 57.
; PLAN: r0=123(x), r1=111(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 111
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
