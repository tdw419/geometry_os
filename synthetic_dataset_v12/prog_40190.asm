; DESCRIPTION: Creates a magenta circular shape at (39, 111) with radius 39.
; PLAN: r0=39(x), r1=111(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 111
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
