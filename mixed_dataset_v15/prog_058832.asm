; DESCRIPTION: Creates a yellow circular shape at (207, 134) with radius 42.
; PLAN: r0=207(x), r1=134(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 134
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
