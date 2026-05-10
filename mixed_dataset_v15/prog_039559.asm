; DESCRIPTION: Renders a green circular shape at (380, 0) with radius 22.
; PLAN: r0=380(x), r1=0(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 0
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
