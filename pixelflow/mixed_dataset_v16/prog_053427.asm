; DESCRIPTION: Creates a yellow circular shape at (394, 116) with radius 54.
; PLAN: r0=394(x), r1=116(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 116
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
