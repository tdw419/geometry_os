; DESCRIPTION: Creates a magenta circular shape at (428, 68) with radius 20.
; PLAN: r0=428(x), r1=68(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 68
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
