; DESCRIPTION: Renders a red disk with center (67, 200) and radius 49.
; PLAN: r0=67(x), r1=200(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 200
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
