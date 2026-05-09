; DESCRIPTION: Places a blue circle of radius 48 at center (71, 154).
; PLAN: r0=71(x), r1=154(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 154
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
