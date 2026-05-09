; DESCRIPTION: Renders a white disk with center (91, 74) and radius 57.
; PLAN: r0=91(x), r1=74(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 74
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
