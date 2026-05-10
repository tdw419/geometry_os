; DESCRIPTION: Composite: Sets a single yellow pixel at (18, 156) then Places a yellow 12x119 rectangle at position (308, 19) then Renders a magenta disk with center (188, 116) and radius 46.
; PLAN: r0=18(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=19(y), r7=12(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=188(x), r11=116(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 308
LDI r6, 19
LDI r7, 12
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 116
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
