; DESCRIPTION: Creates a magenta circular shape at (441, 50) with radius 28.
; PLAN: r0=441(x), r1=50(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 50
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
