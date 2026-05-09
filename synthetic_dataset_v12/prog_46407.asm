; DESCRIPTION: Renders a magenta disk with center (276, 212) and radius 35.
; PLAN: r0=276(x), r1=212(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 212
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
