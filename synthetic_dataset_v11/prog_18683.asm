; DESCRIPTION: Renders a green disk with center (100, 116) and radius 72.
; PLAN: r0=100(x), r1=116(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 116
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
