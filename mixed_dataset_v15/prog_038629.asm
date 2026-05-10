; DESCRIPTION: Creates a magenta circular shape at (178, 206) with radius 39.
; PLAN: r0=178(x), r1=206(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 206
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
