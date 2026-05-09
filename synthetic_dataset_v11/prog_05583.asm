; DESCRIPTION: Creates a magenta circular shape at (184, 65) with radius 54.
; PLAN: r0=184(x), r1=65(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 65
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
