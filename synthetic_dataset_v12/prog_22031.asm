; DESCRIPTION: Creates a green circular shape at (415, 86) with radius 72.
; PLAN: r0=415(x), r1=86(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 86
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
