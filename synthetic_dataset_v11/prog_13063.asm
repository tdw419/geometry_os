; DESCRIPTION: Renders a magenta disk with center (187, 81) and radius 65.
; PLAN: r0=187(x), r1=81(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 81
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
