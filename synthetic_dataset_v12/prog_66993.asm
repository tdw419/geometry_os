; DESCRIPTION: Composite: Sets a single yellow pixel at (359, 229) then Creates a green rectangular region at (75, 25) spanning 17 by 35 pixels then Creates a magenta circular shape at (383, 46) with radius 10.
; PLAN: r0=359(x), r1=229(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=25(y), r7=17(width), r8=35(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x), r11=46(y), r12=10(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 229
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 25
LDI r7, 17
LDI r8, 35
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 46
LDI r12, 10
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
