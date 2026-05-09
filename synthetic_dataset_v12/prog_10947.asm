; DESCRIPTION: Creates a magenta circular shape at (432, 133) with radius 54.
; PLAN: r0=432(x), r1=133(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 133
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
