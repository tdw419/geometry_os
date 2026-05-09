; DESCRIPTION: Creates a blue circular shape at (74, 71) with radius 65.
; PLAN: r0=74(x), r1=71(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 71
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
