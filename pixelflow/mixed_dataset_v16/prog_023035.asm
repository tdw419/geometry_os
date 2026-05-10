; DESCRIPTION: Composite: Renders a yellow disk with center (210, 77) and radius 27 then Creates a red rectangular region at (257, 64) spanning 103 by 70 pixels then Places a green dot at position (414, 129).
; PLAN: r0=210(x), r1=77(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=64(y), r7=103(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=129(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 77
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 64
LDI r7, 103
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 129
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
