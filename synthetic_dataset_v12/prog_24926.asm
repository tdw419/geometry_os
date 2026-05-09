; DESCRIPTION: Composite: Creates a red circular shape at (380, 152) with radius 71 then Renders a white box of size 11x46 starting at (237, 204) then Sets a single blue pixel at (483, 114).
; PLAN: r0=380(x), r1=152(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=204(y), r7=11(width), r8=46(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=483(x), r11=114(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 152
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 204
LDI r7, 11
LDI r8, 46
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 483
LDI r11, 114
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
