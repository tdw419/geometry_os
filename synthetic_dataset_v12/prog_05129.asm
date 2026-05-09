; DESCRIPTION: Renders a magenta disk with center (343, 126) and radius 67.
; PLAN: r0=343(x), r1=126(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 126
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
