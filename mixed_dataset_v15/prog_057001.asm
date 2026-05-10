; DESCRIPTION: Renders a yellow disk with center (310, 173) and radius 67.
; PLAN: r0=310(x), r1=173(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 173
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
