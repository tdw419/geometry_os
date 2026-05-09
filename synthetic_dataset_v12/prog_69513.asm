; DESCRIPTION: Creates a magenta circular shape at (271, 65) with radius 52.
; PLAN: r0=271(x), r1=65(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 65
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
