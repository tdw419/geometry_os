; DESCRIPTION: Creates a magenta circular shape at (181, 90) with radius 59.
; PLAN: r0=181(x), r1=90(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 90
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
