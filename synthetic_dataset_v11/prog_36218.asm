; DESCRIPTION: Renders a red disk with center (157, 111) and radius 69.
; PLAN: r0=157(x), r1=111(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 111
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
