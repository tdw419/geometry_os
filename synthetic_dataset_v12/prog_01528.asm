; DESCRIPTION: Renders a white disk with center (271, 180) and radius 14.
; PLAN: r0=271(x), r1=180(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 180
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
