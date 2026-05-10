; DESCRIPTION: Creates a magenta circular shape at (340, 54) with radius 20.
; PLAN: r0=340(x), r1=54(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 54
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
