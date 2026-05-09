; DESCRIPTION: Composite: Creates a purple rectangular region at (242, 55) spanning 97 by 13 pixels then Draws a green circle centered at (186, 103) with radius 49 then Sets a single purple pixel at (311, 188).
; PLAN: r0=242(x), r1=55(y), r2=97(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=103(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=311(x), r11=188(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 242
LDI r1, 55
LDI r2, 97
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 103
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 311
LDI r11, 188
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
