; DESCRIPTION: Composite: Places a orange dot at position (168, 14) then Places a yellow line segment connecting (341, 155) to (384, 95) then Creates a yellow rectangular region at (83, 30) spanning 50 by 81 pixels.
; PLAN: r0=168(x), r1=14(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=341(x1), r6=155(y1), r7=384(x2), r8=95(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=83(x), r11=30(y), r12=50(width), r13=81(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 14
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 341
LDI r6, 155
LDI r7, 384
LDI r8, 95
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 30
LDI r12, 50
LDI r13, 81
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
