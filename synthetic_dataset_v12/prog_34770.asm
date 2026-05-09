; DESCRIPTION: Creates a yellow circular shape at (405, 50) with radius 43.
; PLAN: r0=405(x), r1=50(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 50
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
