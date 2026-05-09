; DESCRIPTION: Composite: Renders a white line between points (113, 41) and (128, 175) then Places a red 29x75 rectangle at position (468, 97) then Places a cyan circle of radius 33 at center (255, 206).
; PLAN: r0=113(x1), r1=41(y1), r2=128(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=97(y), r7=29(width), r8=75(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=206(y), r12=33(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 41
LDI r2, 128
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 97
LDI r7, 29
LDI r8, 75
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 206
LDI r12, 33
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
