; DESCRIPTION: Creates a yellow circular shape at (207, 215) with radius 23.
; PLAN: r0=207(x), r1=215(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 215
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
