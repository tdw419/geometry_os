; DESCRIPTION: Renders a white disk with center (146, 83) and radius 64.
; PLAN: r0=146(x), r1=83(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 83
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
