; DESCRIPTION: Renders a purple disk with center (156, 99) and radius 72.
; PLAN: r0=156(x), r1=99(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 99
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
