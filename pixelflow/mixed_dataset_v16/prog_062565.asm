; DESCRIPTION: Composite: Creates a magenta rectangular region at (421, 84) spanning 59 by 49 pixels then Sets a single cyan pixel at (408, 240) then Places a orange line segment connecting (12, 251) to (132, 192).
; PLAN: r0=421(x), r1=84(y), r2=59(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=240(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=12(x1), r11=251(y1), r12=132(x2), r13=192(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 84
LDI r2, 59
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 240
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 12
LDI r11, 251
LDI r12, 132
LDI r13, 192
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
