; DESCRIPTION: Creates a blue circular shape at (367, 173) with radius 59.
; PLAN: r0=367(x), r1=173(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 173
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
