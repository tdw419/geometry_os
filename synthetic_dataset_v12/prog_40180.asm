; DESCRIPTION: Creates a yellow circular shape at (187, 76) with radius 70.
; PLAN: r0=187(x), r1=76(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 76
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
