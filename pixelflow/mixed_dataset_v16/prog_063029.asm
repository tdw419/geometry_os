; DESCRIPTION: Renders a red circular shape at (267, 26) with radius 74.
; PLAN: r0=267(x), r1=26(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 26
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
