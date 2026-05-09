; DESCRIPTION: Creates a green circular shape at (142, 173) with radius 32.
; PLAN: r0=142(x), r1=173(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 173
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
