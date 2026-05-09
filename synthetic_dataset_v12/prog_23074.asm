; DESCRIPTION: Composite: Places a green dot at position (242, 111) then Creates a white circular shape at (289, 157) with radius 71 then Draws a yellow line from (494, 28) to (458, 154).
; PLAN: r0=242(x), r1=111(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=157(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=494(x1), r11=28(y1), r12=458(x2), r13=154(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 111
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 289
LDI r6, 157
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 494
LDI r11, 28
LDI r12, 458
LDI r13, 154
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
