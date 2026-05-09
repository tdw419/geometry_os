; DESCRIPTION: Creates a magenta circular shape at (345, 173) with radius 70.
; PLAN: r0=345(x), r1=173(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 173
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
