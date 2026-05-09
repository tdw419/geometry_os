; DESCRIPTION: Creates a blue circular shape at (74, 144) with radius 64.
; PLAN: r0=74(x), r1=144(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 144
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
