; DESCRIPTION: Renders a magenta disk with center (113, 167) and radius 69.
; PLAN: r0=113(x), r1=167(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 167
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
