; DESCRIPTION: Renders a green circular shape at (72, 54) with radius 50.
; PLAN: r0=72(x), r1=54(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 54
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
