; DESCRIPTION: Renders a white disk with center (263, 60) and radius 33.
; PLAN: r0=263(x), r1=60(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 60
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
