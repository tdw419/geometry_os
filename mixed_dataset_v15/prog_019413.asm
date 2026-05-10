; DESCRIPTION: Creates a magenta circular shape at (393, 196) with radius 10.
; PLAN: r0=393(x), r1=196(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 196
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
