; DESCRIPTION: Renders a white disk with center (50, 173) and radius 47.
; PLAN: r0=50(x), r1=173(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 173
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
