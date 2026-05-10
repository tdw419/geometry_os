; DESCRIPTION: Renders a white circular shape at (45, 91) with radius 35.
; PLAN: r0=45(x), r1=91(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 91
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
