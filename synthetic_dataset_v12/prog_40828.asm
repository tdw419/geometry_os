; DESCRIPTION: Composite: Renders a magenta disk with center (53, 169) and radius 31 then Sets a single green pixel at (439, 58) then Creates a cyan rectangular region at (246, 8) spanning 116 by 84 pixels.
; PLAN: r0=53(x), r1=169(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=58(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=246(x), r11=8(y), r12=116(width), r13=84(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 169
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 58
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 246
LDI r11, 8
LDI r12, 116
LDI r13, 84
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
