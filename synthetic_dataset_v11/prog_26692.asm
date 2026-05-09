; DESCRIPTION: Creates a yellow circular shape at (182, 111) with radius 52.
; PLAN: r0=182(x), r1=111(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 111
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
