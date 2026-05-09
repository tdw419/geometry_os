; DESCRIPTION: Renders a white disk with center (460, 209) and radius 26.
; PLAN: r0=460(x), r1=209(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 209
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
