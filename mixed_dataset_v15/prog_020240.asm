; DESCRIPTION: Creates a blue circular shape at (410, 86) with radius 38.
; PLAN: r0=410(x), r1=86(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 86
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
