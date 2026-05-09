; DESCRIPTION: Creates a yellow circular shape at (168, 103) with radius 54.
; PLAN: r0=168(x), r1=103(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 103
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
