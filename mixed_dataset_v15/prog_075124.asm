; DESCRIPTION: Composite: Renders a cyan disk with center (287, 46) and radius 26 then Creates a magenta rectangular region at (415, 90) spanning 11 by 65 pixels then Sets a single blue pixel at (469, 168).
; PLAN: r0=287(x), r1=46(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x), r6=90(y), r7=11(width), r8=65(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=469(x), r11=168(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 287
LDI r1, 46
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 90
LDI r7, 11
LDI r8, 65
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 168
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
