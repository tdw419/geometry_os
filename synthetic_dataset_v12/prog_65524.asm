; DESCRIPTION: Creates a magenta circular shape at (432, 149) with radius 68.
; PLAN: r0=432(x), r1=149(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 149
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
