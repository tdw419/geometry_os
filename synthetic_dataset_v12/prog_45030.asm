; DESCRIPTION: Composite: Sets a single purple pixel at (107, 63) then Renders a black disk with center (211, 198) and radius 19 then Creates a white rectangular region at (252, 147) spanning 117 by 30 pixels.
; PLAN: r0=107(x), r1=63(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=198(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=252(x), r11=147(y), r12=117(width), r13=30(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 63
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 198
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 252
LDI r11, 147
LDI r12, 117
LDI r13, 30
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
