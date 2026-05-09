; DESCRIPTION: Renders a magenta disk with center (187, 72) and radius 49.
; PLAN: r0=187(x), r1=72(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 72
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
