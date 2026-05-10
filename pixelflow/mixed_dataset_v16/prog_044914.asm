; DESCRIPTION: Renders a red disk with center (69, 134) and radius 36.
; PLAN: r0=69(x), r1=134(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 134
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
