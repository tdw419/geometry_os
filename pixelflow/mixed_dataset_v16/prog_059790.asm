; DESCRIPTION: Composite: Places a red dot at position (249, 16) then Creates a cyan rectangular region at (422, 118) spanning 45 by 45 pixels then Draws a magenta circle centered at (90, 105) with radius 79.
; PLAN: r0=249(x), r1=16(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=118(y), r7=45(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x), r11=105(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 16
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 422
LDI r6, 118
LDI r7, 45
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 105
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
