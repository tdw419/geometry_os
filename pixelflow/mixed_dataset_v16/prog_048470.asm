; DESCRIPTION: Composite: Renders a red line between points (384, 99) and (145, 173) then Draws a magenta rectangle at (351, 192) with width 79 and height 60 then Renders a cyan disk with center (104, 179) and radius 61.
; PLAN: r0=384(x1), r1=99(y1), r2=145(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=192(y), r7=79(width), r8=60(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=179(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 99
LDI r2, 145
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 192
LDI r7, 79
LDI r8, 60
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 179
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
