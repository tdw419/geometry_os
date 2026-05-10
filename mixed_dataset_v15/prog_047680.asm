; DESCRIPTION: Renders a yellow circular shape at (74, 93) with radius 32.
; PLAN: r0=74(x), r1=93(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 93
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
