; DESCRIPTION: Composite: Sets a single white pixel at (250, 224) then Renders a yellow disk with center (83, 144) and radius 10 then Renders a black box of size 81x53 starting at (340, 79).
; PLAN: r0=250(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=144(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=340(x), r11=79(y), r12=81(width), r13=53(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 144
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 340
LDI r11, 79
LDI r12, 81
LDI r13, 53
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
