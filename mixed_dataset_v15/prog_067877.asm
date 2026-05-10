; DESCRIPTION: Renders a white disk with center (330, 111) and radius 67.
; PLAN: r0=330(x), r1=111(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 111
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
