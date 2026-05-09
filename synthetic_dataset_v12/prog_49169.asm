; DESCRIPTION: Composite: Renders a yellow box of size 14x71 starting at (457, 136) then Sets a single yellow pixel at (192, 191).
; PLAN: r0=457(x), r1=136(y), r2=14(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=191(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 136
LDI r2, 14
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 191
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
