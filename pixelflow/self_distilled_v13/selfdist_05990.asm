; DESCRIPTION: Renders a magenta circular shape at (216, 143) with radius 74.
; PLAN: r0=216(x), r1=143(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 143
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
