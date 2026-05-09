; DESCRIPTION: Composite: Places a blue line segment connecting (426, 15) to (43, 205) then Places a cyan dot at position (505, 165) then Creates a blue rectangular region at (225, 42) spanning 85 by 107 pixels.
; PLAN: r0=426(x1), r1=15(y1), r2=43(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=505(x), r6=165(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=42(y), r12=85(width), r13=107(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 15
LDI r2, 43
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 165
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 225
LDI r11, 42
LDI r12, 85
LDI r13, 107
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
