; DESCRIPTION: Renders a magenta disk with center (175, 221) and radius 26.
; PLAN: r0=175(x), r1=221(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 221
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
