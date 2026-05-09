; DESCRIPTION: Renders a magenta disk with center (171, 134) and radius 72.
; PLAN: r0=171(x), r1=134(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 134
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
