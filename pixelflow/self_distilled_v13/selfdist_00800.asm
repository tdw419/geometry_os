; DESCRIPTION: Renders a white circular shape at (294, 131) with radius 13.
; PLAN: r0=294(x), r1=131(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 131
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
