; DESCRIPTION: Creates a magenta circular shape at (440, 205) with radius 44.
; PLAN: r0=440(x), r1=205(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 205
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
