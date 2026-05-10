; DESCRIPTION: Composite: Places a green circle of radius 11 at center (34, 43) then Sets a single green pixel at (40, 18) then Renders a magenta box of size 33x38 starting at (427, 32).
; PLAN: r0=34(x), r1=43(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=18(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=427(x), r11=32(y), r12=33(width), r13=38(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 43
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 18
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 427
LDI r11, 32
LDI r12, 33
LDI r13, 38
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
