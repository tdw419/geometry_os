; DESCRIPTION: Renders a white disk with center (87, 79) and radius 63.
; PLAN: r0=87(x), r1=79(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 79
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
