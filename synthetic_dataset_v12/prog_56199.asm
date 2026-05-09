; DESCRIPTION: Renders a magenta disk with center (316, 61) and radius 50.
; PLAN: r0=316(x), r1=61(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 61
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
