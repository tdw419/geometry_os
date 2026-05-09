; DESCRIPTION: Renders a magenta disk with center (476, 146) and radius 26.
; PLAN: r0=476(x), r1=146(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 146
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
