; DESCRIPTION: Renders a white disk with center (176, 150) and radius 65.
; PLAN: r0=176(x), r1=150(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 150
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
