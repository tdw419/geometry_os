; DESCRIPTION: Creates a yellow circular shape at (220, 116) with radius 52.
; PLAN: r0=220(x), r1=116(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 116
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
