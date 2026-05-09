; DESCRIPTION: Composite: Renders a green disk with center (115, 164) and radius 67 then Sets a single white pixel at (322, 152).
; PLAN: r0=115(x), r1=164(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=152(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 164
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 152
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
