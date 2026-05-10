; DESCRIPTION: Renders a black disk with center (284, 91) and radius 78.
; PLAN: r0=284(x), r1=91(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 91
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
