; DESCRIPTION: Creates a yellow circular shape at (234, 146) with radius 69.
; PLAN: r0=234(x), r1=146(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 146
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
