; DESCRIPTION: Renders a yellow disk with center (73, 68) and radius 67.
; PLAN: r0=73(x), r1=68(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 68
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
