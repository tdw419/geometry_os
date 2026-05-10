; DESCRIPTION: Composite: Places a purple line segment connecting (311, 55) to (297, 120) then Draws a magenta rectangle at (143, 67) with width 36 and height 40 then Places a cyan dot at position (375, 129).
; PLAN: r0=311(x1), r1=55(y1), r2=297(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=67(y), r7=36(width), r8=40(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=129(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 55
LDI r2, 297
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 67
LDI r7, 36
LDI r8, 40
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 129
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
