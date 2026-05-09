; DESCRIPTION: Composite: Creates a cyan circular shape at (67, 61) with radius 36 then Draws a cyan rectangle at (349, 119) with width 17 and height 113 then Renders a white line between points (278, 143) and (37, 147).
; PLAN: r0=67(x), r1=61(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=119(y), r7=17(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x1), r11=143(y1), r12=37(x2), r13=147(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 61
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 119
LDI r7, 17
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 143
LDI r12, 37
LDI r13, 147
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
