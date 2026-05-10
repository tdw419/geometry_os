; DESCRIPTION: Renders a white disk with center (182, 103) and radius 56.
; PLAN: r0=182(x), r1=103(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 103
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
