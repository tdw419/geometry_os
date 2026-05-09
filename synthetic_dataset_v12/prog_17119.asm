; DESCRIPTION: Composite: Places a yellow line segment connecting (164, 82) to (344, 109) then Draws a blue rectangle at (294, 115) with width 102 and height 105 then Places a green dot at position (150, 250).
; PLAN: r0=164(x1), r1=82(y1), r2=344(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=115(y), r7=102(width), r8=105(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=150(x), r11=250(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 82
LDI r2, 344
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 115
LDI r7, 102
LDI r8, 105
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 250
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
