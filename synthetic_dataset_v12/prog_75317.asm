; DESCRIPTION: Creates a magenta circular shape at (90, 173) with radius 32.
; PLAN: r0=90(x), r1=173(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 173
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
