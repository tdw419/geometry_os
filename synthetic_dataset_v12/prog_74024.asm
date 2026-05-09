; DESCRIPTION: Composite: Sets a single blue pixel at (218, 214) then Creates a magenta rectangular region at (350, 44) spanning 15 by 107 pixels then Draws a green circle centered at (409, 85) with radius 38.
; PLAN: r0=218(x), r1=214(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=44(y), r7=15(width), r8=107(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x), r11=85(y), r12=38(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 218
LDI r1, 214
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 44
LDI r7, 15
LDI r8, 107
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 85
LDI r12, 38
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
