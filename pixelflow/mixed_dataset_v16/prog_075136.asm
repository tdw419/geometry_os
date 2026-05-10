; DESCRIPTION: Composite: Sets a single blue pixel at (231, 139) then Places a magenta 96x33 rectangle at position (88, 145) then Places a white circle of radius 50 at center (207, 105).
; PLAN: r0=231(x), r1=139(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=145(y), r7=96(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x), r11=105(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 231
LDI r1, 139
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 145
LDI r7, 96
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 105
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
