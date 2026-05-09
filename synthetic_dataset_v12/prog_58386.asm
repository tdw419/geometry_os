; DESCRIPTION: Renders a magenta disk with center (123, 141) and radius 16.
; PLAN: r0=123(x), r1=141(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 141
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
