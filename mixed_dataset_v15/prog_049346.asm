; DESCRIPTION: Composite: Places a magenta circle of radius 35 at center (78, 71) then Sets a single yellow pixel at (178, 26) then Creates a cyan rectangular region at (23, 197) spanning 50 by 29 pixels.
; PLAN: r0=78(x), r1=71(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=26(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=23(x), r11=197(y), r12=50(width), r13=29(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 71
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 26
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 23
LDI r11, 197
LDI r12, 50
LDI r13, 29
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
