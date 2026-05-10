; DESCRIPTION: Composite: Creates a cyan circular shape at (119, 84) with radius 16 then Creates a white rectangular region at (57, 197) spanning 42 by 47 pixels then Draws a white line from (394, 57) to (13, 176).
; PLAN: r0=119(x), r1=84(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=197(y), r7=42(width), r8=47(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x1), r11=57(y1), r12=13(x2), r13=176(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 84
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 197
LDI r7, 42
LDI r8, 47
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 57
LDI r12, 13
LDI r13, 176
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
