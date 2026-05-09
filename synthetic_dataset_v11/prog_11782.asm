; DESCRIPTION: Creates a magenta circular shape at (69, 113) with radius 58.
; PLAN: r0=69(x), r1=113(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 113
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
