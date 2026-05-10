; DESCRIPTION: Creates a yellow circular shape at (50, 69) with radius 11.
; PLAN: r0=50(x), r1=69(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 69
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
