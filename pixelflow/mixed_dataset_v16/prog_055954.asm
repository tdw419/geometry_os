; DESCRIPTION: Composite: Sets a single yellow pixel at (182, 176) then Draws a magenta rectangle at (195, 180) with width 116 and height 49 then Creates a purple circular shape at (260, 102) with radius 58.
; PLAN: r0=182(x), r1=176(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=180(y), r7=116(width), r8=49(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x), r11=102(y), r12=58(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 182
LDI r1, 176
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 195
LDI r6, 180
LDI r7, 116
LDI r8, 49
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 102
LDI r12, 58
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
