; DESCRIPTION: Composite: Places a red line segment connecting (42, 169) to (216, 145) then Draws a white rectangle at (32, 71) with width 107 and height 119 then Places a cyan circle of radius 60 at center (332, 100).
; PLAN: r0=42(x1), r1=169(y1), r2=216(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=71(y), r7=107(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x), r11=100(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 42
LDI r1, 169
LDI r2, 216
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 71
LDI r7, 107
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 100
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
