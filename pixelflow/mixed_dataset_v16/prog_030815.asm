; DESCRIPTION: Composite: Draws a green circle centered at (173, 173) with radius 68 then Draws a magenta rectangle at (90, 204) with width 36 and height 31 then Sets a single black pixel at (210, 112).
; PLAN: r0=173(x), r1=173(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=90(x), r6=204(y), r7=36(width), r8=31(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x), r11=112(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 173
LDI r1, 173
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 90
LDI r6, 204
LDI r7, 36
LDI r8, 31
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 112
LDI r12, 0x000000
PSET r10, r11, r12
HALT
