; DESCRIPTION: Creates a magenta circular shape at (212, 171) with radius 13.
; PLAN: r0=212(x), r1=171(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 171
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
