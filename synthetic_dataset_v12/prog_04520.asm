; DESCRIPTION: Renders a white disk with center (174, 69) and radius 68.
; PLAN: r0=174(x), r1=69(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 69
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
