; DESCRIPTION: Renders a white disk with center (180, 175) and radius 63.
; PLAN: r0=180(x), r1=175(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 175
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
