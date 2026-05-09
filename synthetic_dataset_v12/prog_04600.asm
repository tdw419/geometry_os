; DESCRIPTION: Composite: Sets a single cyan pixel at (39, 15) then Creates a yellow rectangular region at (451, 126) spanning 28 by 111 pixels then Draws a red circle centered at (99, 96) with radius 51.
; PLAN: r0=39(x), r1=15(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=451(x), r6=126(y), r7=28(width), r8=111(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=96(y), r12=51(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 15
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 451
LDI r6, 126
LDI r7, 28
LDI r8, 111
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 96
LDI r12, 51
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
