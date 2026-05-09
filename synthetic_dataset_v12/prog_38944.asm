; DESCRIPTION: Renders a white disk with center (328, 220) and radius 12.
; PLAN: r0=328(x), r1=220(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 220
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
