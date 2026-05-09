; DESCRIPTION: Creates a magenta circular shape at (245, 143) with radius 16.
; PLAN: r0=245(x), r1=143(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 143
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
