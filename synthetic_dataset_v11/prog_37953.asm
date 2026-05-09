; DESCRIPTION: Renders a green disk with center (161, 116) and radius 56.
; PLAN: r0=161(x), r1=116(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 116
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
