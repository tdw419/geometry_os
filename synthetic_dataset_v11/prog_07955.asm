; DESCRIPTION: Creates a yellow circular shape at (72, 47) with radius 39.
; PLAN: r0=72(x), r1=47(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 47
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
