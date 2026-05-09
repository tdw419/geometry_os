; DESCRIPTION: Composite: Places a black line segment connecting (413, 203) to (110, 185) then Draws a cyan rectangle at (264, 190) with width 72 and height 32 then Creates a cyan circular shape at (280, 94) with radius 48.
; PLAN: r0=413(x1), r1=203(y1), r2=110(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=190(y), r7=72(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x), r11=94(y), r12=48(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 413
LDI r1, 203
LDI r2, 110
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 190
LDI r7, 72
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 94
LDI r12, 48
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
