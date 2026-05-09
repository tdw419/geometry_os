; DESCRIPTION: Creates a yellow circular shape at (203, 46) with radius 46.
; PLAN: r0=203(x), r1=46(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 46
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
