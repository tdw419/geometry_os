; DESCRIPTION: Renders a white disk with center (113, 65) and radius 27.
; PLAN: r0=113(x), r1=65(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 65
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
