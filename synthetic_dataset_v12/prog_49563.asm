; DESCRIPTION: Creates a magenta circular shape at (218, 150) with radius 55.
; PLAN: r0=218(x), r1=150(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 150
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
