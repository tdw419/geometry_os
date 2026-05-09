; DESCRIPTION: Creates a yellow circular shape at (222, 164) with radius 74.
; PLAN: r0=222(x), r1=164(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 164
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
