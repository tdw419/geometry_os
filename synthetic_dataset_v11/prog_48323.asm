; DESCRIPTION: Creates a yellow circular shape at (138, 207) with radius 42.
; PLAN: r0=138(x), r1=207(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 207
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
