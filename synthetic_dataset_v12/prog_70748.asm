; DESCRIPTION: Composite: Renders a yellow box of size 43x27 starting at (384, 48) then Sets a single yellow pixel at (415, 45) then Renders a blue disk with center (242, 156) and radius 26.
; PLAN: r0=384(x), r1=48(y), r2=43(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=45(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=242(x), r11=156(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 48
LDI r2, 43
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 45
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 242
LDI r11, 156
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
