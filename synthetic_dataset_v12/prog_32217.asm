; DESCRIPTION: Composite: Renders a black disk with center (82, 160) and radius 55 then Creates a red rectangular region at (91, 196) spanning 18 by 46 pixels then Sets a single cyan pixel at (390, 154).
; PLAN: r0=82(x), r1=160(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x), r6=196(y), r7=18(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x), r11=154(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 160
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 196
LDI r7, 18
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 154
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
