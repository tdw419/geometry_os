; DESCRIPTION: Renders a white circular shape at (362, 188) with radius 71.
; PLAN: r0=362(x), r1=188(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 188
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
