; DESCRIPTION: Composite: Sets a single yellow pixel at (220, 19) then Creates a green rectangular region at (296, 34) spanning 93 by 91 pixels then Draws a green circle centered at (313, 77) with radius 23.
; PLAN: r0=220(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=34(y), r7=93(width), r8=91(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x), r11=77(y), r12=23(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 296
LDI r6, 34
LDI r7, 93
LDI r8, 91
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 77
LDI r12, 23
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
