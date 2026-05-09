; DESCRIPTION: Renders a white disk with center (386, 21) and radius 10.
; PLAN: r0=386(x), r1=21(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 21
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
