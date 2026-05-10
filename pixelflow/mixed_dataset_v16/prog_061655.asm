; DESCRIPTION: Creates a magenta circular shape at (363, 171) with radius 19.
; PLAN: r0=363(x), r1=171(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 171
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
