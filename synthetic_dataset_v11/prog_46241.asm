; DESCRIPTION: Renders a magenta disk with center (171, 126) and radius 56.
; PLAN: r0=171(x), r1=126(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 126
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
