; DESCRIPTION: Creates a magenta circular shape at (121, 208) with radius 30.
; PLAN: r0=121(x), r1=208(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 208
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
