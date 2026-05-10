; DESCRIPTION: Creates a yellow circular shape at (126, 103) with radius 26.
; PLAN: r0=126(x), r1=103(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 103
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
