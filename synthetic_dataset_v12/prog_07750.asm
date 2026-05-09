; DESCRIPTION: Creates a yellow circular shape at (326, 190) with radius 62.
; PLAN: r0=326(x), r1=190(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 190
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
