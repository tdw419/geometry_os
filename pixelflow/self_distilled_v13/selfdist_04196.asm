; DESCRIPTION: Renders a white circular shape at (212, 91) with radius 78.
; PLAN: r0=212(x), r1=91(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 91
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
