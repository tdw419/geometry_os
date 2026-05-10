; DESCRIPTION: Composite: Places a magenta 110x99 rectangle at position (226, 31) then Draws a white circle centered at (195, 165) with radius 61 then Sets a single purple pixel at (248, 231).
; PLAN: r0=226(x), r1=31(y), r2=110(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=165(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x), r11=231(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 31
LDI r2, 110
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 165
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 231
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
