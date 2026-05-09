; DESCRIPTION: Renders a yellow disk with center (178, 134) and radius 67.
; PLAN: r0=178(x), r1=134(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 134
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
