; DESCRIPTION: Renders a yellow circular shape at (223, 40) with radius 42.
; PLAN: r0=223(x), r1=40(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 40
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
