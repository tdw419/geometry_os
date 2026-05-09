; DESCRIPTION: Renders a red disk with center (81, 174) and radius 63.
; PLAN: r0=81(x), r1=174(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 174
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
