; DESCRIPTION: Composite: Places a cyan dot at position (139, 203) then Places a yellow line segment connecting (495, 27) to (261, 71) then Renders a orange disk with center (442, 96) and radius 48.
; PLAN: r0=139(x), r1=203(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=495(x1), r6=27(y1), r7=261(x2), r8=71(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=96(y), r12=48(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 139
LDI r1, 203
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 495
LDI r6, 27
LDI r7, 261
LDI r8, 71
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 96
LDI r12, 48
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
