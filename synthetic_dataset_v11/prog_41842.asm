; DESCRIPTION: Renders a blue disk with center (156, 138) and radius 16.
; PLAN: r0=156(x), r1=138(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 138
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
