; DESCRIPTION: Renders a white disk with center (104, 166) and radius 68.
; PLAN: r0=104(x), r1=166(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 166
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
