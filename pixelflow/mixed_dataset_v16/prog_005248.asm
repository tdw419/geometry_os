; DESCRIPTION: Renders a white disk with center (120, 166) and radius 23.
; PLAN: r0=120(x), r1=166(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 166
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
