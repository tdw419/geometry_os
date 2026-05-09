; DESCRIPTION: Composite: Sets a single cyan pixel at (334, 219) then Places a magenta 11x56 rectangle at position (152, 44) then Renders a green disk with center (58, 203) and radius 26.
; PLAN: r0=334(x), r1=219(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=44(y), r7=11(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=58(x), r11=203(y), r12=26(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 219
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 44
LDI r7, 11
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 203
LDI r12, 26
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
