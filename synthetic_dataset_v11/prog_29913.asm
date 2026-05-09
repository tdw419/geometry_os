; DESCRIPTION: Creates a magenta circular shape at (107, 171) with radius 72.
; PLAN: r0=107(x), r1=171(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 171
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
