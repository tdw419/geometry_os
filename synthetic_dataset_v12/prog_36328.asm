; DESCRIPTION: Creates a magenta circular shape at (276, 195) with radius 14.
; PLAN: r0=276(x), r1=195(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 195
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
