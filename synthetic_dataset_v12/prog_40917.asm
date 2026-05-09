; DESCRIPTION: Composite: Sets a single cyan pixel at (415, 222) then Renders a cyan box of size 108x79 starting at (111, 54) then Creates a purple circular shape at (185, 89) with radius 53.
; PLAN: r0=415(x), r1=222(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=54(y), r7=108(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=185(x), r11=89(y), r12=53(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 415
LDI r1, 222
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 111
LDI r6, 54
LDI r7, 108
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 89
LDI r12, 53
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
