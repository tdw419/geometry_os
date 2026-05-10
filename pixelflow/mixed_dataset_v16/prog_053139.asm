; DESCRIPTION: Composite: Sets a single blue pixel at (226, 172) then Renders a white box of size 49x17 starting at (145, 141) then Renders a blue disk with center (242, 46) and radius 26.
; PLAN: r0=226(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=141(y), r7=49(width), r8=17(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=242(x), r11=46(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 145
LDI r6, 141
LDI r7, 49
LDI r8, 17
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 46
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
