; DESCRIPTION: Renders a white disk with center (208, 180) and radius 32.
; PLAN: r0=208(x), r1=180(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 180
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
