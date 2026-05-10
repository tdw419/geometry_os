; DESCRIPTION: Renders a green circular shape at (277, 98) with radius 28.
; PLAN: r0=277(x), r1=98(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 98
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
