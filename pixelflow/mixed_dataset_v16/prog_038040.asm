; DESCRIPTION: Renders a white circular shape at (266, 129) with radius 40.
; PLAN: r0=266(x), r1=129(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 129
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
