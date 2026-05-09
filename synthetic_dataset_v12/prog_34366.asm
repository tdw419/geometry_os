; DESCRIPTION: Creates a magenta circular shape at (214, 218) with radius 15.
; PLAN: r0=214(x), r1=218(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 218
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
