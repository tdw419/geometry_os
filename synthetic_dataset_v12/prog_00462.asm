; DESCRIPTION: Renders a magenta disk with center (123, 95) and radius 32.
; PLAN: r0=123(x), r1=95(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 95
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
