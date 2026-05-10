; DESCRIPTION: Creates a blue circular shape at (415, 40) with radius 28.
; PLAN: r0=415(x), r1=40(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 40
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
