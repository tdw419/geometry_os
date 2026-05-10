; DESCRIPTION: Creates a yellow circular shape at (127, 151) with radius 42.
; PLAN: r0=127(x), r1=151(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 151
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
