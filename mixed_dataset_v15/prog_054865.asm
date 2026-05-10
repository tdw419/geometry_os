; DESCRIPTION: Composite: Places a yellow dot at position (131, 65) then Renders a orange disk with center (224, 82) and radius 62 then Creates a blue rectangular region at (164, 71) spanning 116 by 52 pixels.
; PLAN: r0=131(x), r1=65(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=82(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=164(x), r11=71(y), r12=116(width), r13=52(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 65
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 224
LDI r6, 82
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 164
LDI r11, 71
LDI r12, 116
LDI r13, 52
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
