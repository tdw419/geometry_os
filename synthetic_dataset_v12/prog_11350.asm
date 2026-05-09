; DESCRIPTION: Composite: Renders a magenta line between points (75, 105) and (134, 16) then Draws a blue rectangle at (339, 197) with width 32 and height 48 then Places a white dot at position (344, 55).
; PLAN: r0=75(x1), r1=105(y1), r2=134(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=197(y), r7=32(width), r8=48(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x), r11=55(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 105
LDI r2, 134
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 197
LDI r7, 32
LDI r8, 48
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 55
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
