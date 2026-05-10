; DESCRIPTION: Composite: Renders a black disk with center (357, 87) and radius 62 then Sets a single yellow pixel at (425, 199) then Places a blue 62x52 rectangle at position (323, 137).
; PLAN: r0=357(x), r1=87(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=199(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=323(x), r11=137(y), r12=62(width), r13=52(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 87
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 199
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 323
LDI r11, 137
LDI r12, 62
LDI r13, 52
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
