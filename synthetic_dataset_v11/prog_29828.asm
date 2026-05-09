; DESCRIPTION: Creates a magenta circular shape at (162, 141) with radius 22.
; PLAN: r0=162(x), r1=141(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 141
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
