; DESCRIPTION: Composite: Places a white 42x30 rectangle at position (8, 215) then Renders a white line between points (255, 107) and (339, 30) then Draws a white circle centered at (163, 79) with radius 13.
; PLAN: r0=8(x), r1=215(y), r2=42(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x1), r6=107(y1), r7=339(x2), r8=30(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=163(x), r11=79(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 8
LDI r1, 215
LDI r2, 42
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 107
LDI r7, 339
LDI r8, 30
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 163
LDI r11, 79
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
