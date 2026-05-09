; DESCRIPTION: Creates a yellow circular shape at (166, 126) with radius 38.
; PLAN: r0=166(x), r1=126(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 126
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
