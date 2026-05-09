; DESCRIPTION: Renders a red disk with center (240, 87) and radius 22.
; PLAN: r0=240(x), r1=87(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 87
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
