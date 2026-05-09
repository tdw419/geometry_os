; DESCRIPTION: Composite: Draws a white line from (315, 189) to (258, 182) then Places a red 89x100 rectangle at position (265, 144) then Places a green circle of radius 68 at center (256, 102).
; PLAN: r0=315(x1), r1=189(y1), r2=258(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=144(y), r7=89(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=102(y), r12=68(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 189
LDI r2, 258
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 144
LDI r7, 89
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 102
LDI r12, 68
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
