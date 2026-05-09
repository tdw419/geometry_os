; DESCRIPTION: Creates a yellow circular shape at (294, 160) with radius 23.
; PLAN: r0=294(x), r1=160(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 160
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
