; DESCRIPTION: Composite: Sets a single yellow pixel at (347, 89) then Draws a white line from (42, 76) to (211, 136) then Renders a magenta box of size 30x28 starting at (31, 224).
; PLAN: r0=347(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=76(y1), r7=211(x2), r8=136(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=31(x), r11=224(y), r12=30(width), r13=28(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 89
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 42
LDI r6, 76
LDI r7, 211
LDI r8, 136
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 224
LDI r12, 30
LDI r13, 28
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
