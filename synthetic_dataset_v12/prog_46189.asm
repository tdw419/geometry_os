; DESCRIPTION: Creates a yellow circular shape at (277, 129) with radius 42.
; PLAN: r0=277(x), r1=129(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 129
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
