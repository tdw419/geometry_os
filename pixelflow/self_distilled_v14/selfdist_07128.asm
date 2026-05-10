; DESCRIPTION: Renders a green circular shape at (70, 20) with radius 35.
; PLAN: r0=70(x), r1=20(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 20
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
