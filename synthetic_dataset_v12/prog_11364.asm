; DESCRIPTION: Creates a magenta circular shape at (412, 106) with radius 54.
; PLAN: r0=412(x), r1=106(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 106
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
