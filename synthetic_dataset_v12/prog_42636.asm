; DESCRIPTION: Renders a white disk with center (199, 168) and radius 45.
; PLAN: r0=199(x), r1=168(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 168
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
