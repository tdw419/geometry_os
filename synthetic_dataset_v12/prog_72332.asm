; DESCRIPTION: Renders a red disk with center (411, 119) and radius 67.
; PLAN: r0=411(x), r1=119(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 119
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
