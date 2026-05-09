; DESCRIPTION: Renders a white disk with center (277, 167) and radius 10.
; PLAN: r0=277(x), r1=167(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 167
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
