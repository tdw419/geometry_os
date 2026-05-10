; DESCRIPTION: Renders a magenta disk with center (126, 115) and radius 28.
; PLAN: r0=126(x), r1=115(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 115
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
