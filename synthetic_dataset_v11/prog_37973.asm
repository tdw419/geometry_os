; DESCRIPTION: Renders a magenta disk with center (116, 146) and radius 62.
; PLAN: r0=116(x), r1=146(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 146
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
