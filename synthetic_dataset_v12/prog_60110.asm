; DESCRIPTION: Creates a blue circular shape at (268, 173) with radius 16.
; PLAN: r0=268(x), r1=173(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 173
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
