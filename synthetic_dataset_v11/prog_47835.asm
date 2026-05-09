; DESCRIPTION: Renders a magenta disk with center (64, 210) and radius 15.
; PLAN: r0=64(x), r1=210(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 210
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
