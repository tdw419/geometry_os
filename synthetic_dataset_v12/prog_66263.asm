; DESCRIPTION: Composite: Places a blue dot at position (13, 64) then Draws a cyan line from (153, 167) to (231, 203) then Creates a blue rectangular region at (111, 203) spanning 75 by 17 pixels.
; PLAN: r0=13(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=153(x1), r6=167(y1), r7=231(x2), r8=203(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=203(y), r12=75(width), r13=17(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 153
LDI r6, 167
LDI r7, 231
LDI r8, 203
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 203
LDI r12, 75
LDI r13, 17
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
