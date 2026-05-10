; DESCRIPTION: Creates a yellow circular shape at (405, 90) with radius 63.
; PLAN: r0=405(x), r1=90(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 90
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
