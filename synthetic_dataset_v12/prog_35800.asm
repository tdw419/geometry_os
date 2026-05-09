; DESCRIPTION: Creates a magenta circular shape at (231, 80) with radius 30.
; PLAN: r0=231(x), r1=80(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 80
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
