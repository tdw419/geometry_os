; DESCRIPTION: Renders a white disk with center (441, 180) and radius 49.
; PLAN: r0=441(x), r1=180(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 180
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
