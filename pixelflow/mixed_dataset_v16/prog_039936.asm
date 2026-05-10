; DESCRIPTION: Creates a magenta circular shape at (264, 113) with radius 54.
; PLAN: r0=264(x), r1=113(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 113
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
