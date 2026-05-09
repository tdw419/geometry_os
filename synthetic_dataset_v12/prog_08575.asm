; DESCRIPTION: Creates a yellow circular shape at (485, 60) with radius 10.
; PLAN: r0=485(x), r1=60(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 485
LDI r1, 60
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
