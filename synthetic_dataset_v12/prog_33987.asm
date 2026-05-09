; DESCRIPTION: Creates a magenta circular shape at (242, 170) with radius 30.
; PLAN: r0=242(x), r1=170(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 170
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
