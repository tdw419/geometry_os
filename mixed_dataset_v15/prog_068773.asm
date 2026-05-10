; DESCRIPTION: Composite: Places a purple circle of radius 35 at center (136, 173) then Creates a cyan rectangular region at (368, 185) spanning 88 by 52 pixels then Sets a single red pixel at (474, 189).
; PLAN: r0=136(x), r1=173(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=185(y), r7=88(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=474(x), r11=189(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 173
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 185
LDI r7, 88
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 189
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
