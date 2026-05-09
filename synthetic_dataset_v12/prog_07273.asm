; DESCRIPTION: Composite: Sets a single green pixel at (56, 17) then Places a magenta 91x52 rectangle at position (96, 101) then Renders a magenta line between points (273, 128) and (499, 170).
; PLAN: r0=56(x), r1=17(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=101(y), r7=91(width), r8=52(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x1), r11=128(y1), r12=499(x2), r13=170(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 17
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 96
LDI r6, 101
LDI r7, 91
LDI r8, 52
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 128
LDI r12, 499
LDI r13, 170
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
