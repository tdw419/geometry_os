; DESCRIPTION: Renders a yellow circular shape at (239, 178) with radius 54.
; PLAN: r0=239(x), r1=178(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 178
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
