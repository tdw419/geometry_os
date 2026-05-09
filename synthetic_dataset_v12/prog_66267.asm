; DESCRIPTION: Renders a white disk with center (449, 202) and radius 32.
; PLAN: r0=449(x), r1=202(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 202
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
