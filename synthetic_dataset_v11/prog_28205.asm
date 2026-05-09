; DESCRIPTION: Renders a magenta disk with center (74, 216) and radius 16.
; PLAN: r0=74(x), r1=216(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 216
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
