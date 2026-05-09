; DESCRIPTION: Renders a white disk with center (146, 146) and radius 63.
; PLAN: r0=146(x), r1=146(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 146
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
