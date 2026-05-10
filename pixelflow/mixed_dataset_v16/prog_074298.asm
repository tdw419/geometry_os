; DESCRIPTION: Renders a red disk with center (261, 134) and radius 67.
; PLAN: r0=261(x), r1=134(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 134
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
