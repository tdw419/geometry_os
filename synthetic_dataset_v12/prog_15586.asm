; DESCRIPTION: Composite: Places a white line segment connecting (425, 252) to (435, 121) then Draws a purple rectangle at (42, 94) with width 102 and height 29 then Sets a single blue pixel at (56, 158).
; PLAN: r0=425(x1), r1=252(y1), r2=435(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=94(y), r7=102(width), r8=29(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x), r11=158(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 425
LDI r1, 252
LDI r2, 435
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 94
LDI r7, 102
LDI r8, 29
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 158
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
