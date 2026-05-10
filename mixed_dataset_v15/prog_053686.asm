; DESCRIPTION: Creates a magenta circular shape at (387, 165) with radius 66.
; PLAN: r0=387(x), r1=165(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 165
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
