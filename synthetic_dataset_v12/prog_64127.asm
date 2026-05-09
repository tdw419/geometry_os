; DESCRIPTION: Renders a yellow disk with center (430, 168) and radius 67.
; PLAN: r0=430(x), r1=168(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 168
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
