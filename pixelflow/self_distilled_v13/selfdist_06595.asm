; DESCRIPTION: Renders a yellow circular shape at (239, 107) with radius 63.
; PLAN: r0=239(x), r1=107(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 107
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
