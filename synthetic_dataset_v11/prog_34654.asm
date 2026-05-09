; DESCRIPTION: Renders a white disk with center (74, 27) and radius 21.
; PLAN: r0=74(x), r1=27(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 27
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
