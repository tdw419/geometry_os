; DESCRIPTION: Creates a black circular shape at (280, 173) with radius 25.
; PLAN: r0=280(x), r1=173(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 173
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
