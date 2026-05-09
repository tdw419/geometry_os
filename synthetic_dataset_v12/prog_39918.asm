; DESCRIPTION: Renders a blue disk with center (123, 116) and radius 32.
; PLAN: r0=123(x), r1=116(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 116
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
