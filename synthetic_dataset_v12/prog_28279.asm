; DESCRIPTION: Renders a red disk with center (420, 159) and radius 78.
; PLAN: r0=420(x), r1=159(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 159
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
