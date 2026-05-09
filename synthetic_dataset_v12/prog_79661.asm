; DESCRIPTION: Renders a magenta disk with center (215, 97) and radius 64.
; PLAN: r0=215(x), r1=97(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 97
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
