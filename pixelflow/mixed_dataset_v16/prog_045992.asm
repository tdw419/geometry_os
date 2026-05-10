; DESCRIPTION: Composite: Sets a single cyan pixel at (240, 5) then Creates a yellow rectangular region at (225, 92) spanning 31 by 97 pixels then Renders a yellow disk with center (180, 174) and radius 26.
; PLAN: r0=240(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=92(y), r7=31(width), r8=97(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x), r11=174(y), r12=26(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 225
LDI r6, 92
LDI r7, 31
LDI r8, 97
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 174
LDI r12, 26
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
