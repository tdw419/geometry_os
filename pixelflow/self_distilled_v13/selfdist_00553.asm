; DESCRIPTION: Renders a green circular shape at (329, 91) with radius 32.
; PLAN: r0=329(x), r1=91(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 91
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
