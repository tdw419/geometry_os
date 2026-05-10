; DESCRIPTION: Renders a blue circular shape at (179, 154) with radius 35.
; PLAN: r0=179(x), r1=154(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 154
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
